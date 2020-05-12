## FETCH WAVEFORM
function fetch_wfm(obj::T; ch::String="1") where {T<:LCR6xxx}
	valid_wfm_template_name     = "LECROY_2_3"
	valid_wfm_template_desc_pos = 17:26
	wfm_desc_len                = 346
	write(obj, "CHDR OFF") # turn command header Off(no more "VBS" string)
	# Manual "LeCroy_wr2_rcm_revb.pdf" page 44ff
	# The assumption is that the descriptor is 346 bytes long. The
	# length depends on the LeCroy waveform template;the template 
	# used to do the asumption is "LECROY_2_3".
	
	# Get gain, offset, initial_x and x_increment
	gain   = query(obj, "VBS? return=app.Acquisition.C$ch.Out.Result.VerticalPerStep")
	gain   = parse(Float64,gain)
	offset = query(obj, "VBS? return=app.Acquisition.C$ch.Out.Result.VerticalOffset")
	offset = parse(Float64,offset)
	initial_x = query(obj, "VBS? return=app.Acquisition.C$ch.Out.Result.HorizontalOffset")
	x_increm  = query(obj, "VBS? return=app.Acquisition.C$ch.Out.Result.HorizontalPerStep")

	# Prepare scope for waveform reading
	write(obj, "CFMT DEF9,WORD,BIN");# Set the format to 16-bit binary block
	write(obj, "CORD LO"); # Set the byte order to Little Endian
	write(obj, "C$ch:WF? ALL");
	# Hint: DAT1 reads data block 1. ALL reads all, inkl
	# waveform descriptor. Changed from DAT1 to ALL because some 8
	# channel devices did not return measurement data when using
	# DAT1. This makes it necessary that the descriptor has to be
	# removed from the masurement data.

	# Parse header, format: #<length of size field><block size>
	while true
		if viRead(obj.handle,bufSize = UInt32(1)) == "#"
			break
		end
	end

	sl = viRead(obj.handle,bufSize = UInt32(1))
	sl = parse(Float64,sl) # length of size field
	sz = viRead(obj.handle,bufSize = UInt32(sl))
	sz = parse(Int64,sz) # block size

	# Read descriptor
	desc_buffer = Array{UInt8}(undef,wfm_desc_len)
	viRead!(obj.handle, desc_buffer)

	# Check template version, if not mathing, error out because waveform might be invalid
	template_version = String(desc_buffer[valid_wfm_template_desc_pos])
	if template_version != valid_wfm_template_name
		error("Template mismatch, invalid waveform!")
	end

	# Read waveform
	sz = sz - wfm_desc_len
	y_buffer = Array{UInt8}(undef,Int64(sz))
	viRead!(obj.handle, y_buffer)

	# Read termchar
	viRead(obj.handle,bufSize = UInt32(1));

	# Convert from UInt8 to Int16 (each sample is 2 bytes)
	y = reinterpret(Int16,y_buffer)
	# Scale and offset
	y = y .* gain .+ offset
	initial_x = parse(Float64, initial_x)
	x_increm = parse(Float64, x_increm)
	return y, initial_x, x_increm
end
