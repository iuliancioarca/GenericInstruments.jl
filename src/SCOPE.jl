module SCOPE
include("comm_utils.jl")
include("INSTR_TYPES.jl")
# METHOD TEMPLATES
# basic method template: "This method has priority over the more general T:<Union{....} template"
#set_wfm(fgen::INSTR{:Agilent33500B},func="sinusoid",ch=1) = write(fgen.obj,"SOURce$ch:FUNC $func")
# more general method template, superseded by basic method template
#set_wfm(fgen::T,func="sinusoid",ch=1) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:FUNC $func")

# Reset
reset_instr(scope::T) where {T<:LCR6xxx} = write(scope.obj,"*RST")
# IDN
get_idn(scope::T) where {T<:LCR6xxx} = query(scope.obj,"*IDN?")
# Default setup
default_setup(scope::T) where {T<:LCR6xxx} = write(scope.obj,"VBS app.SetToDefaultSetup")
# Vertical range
set_vrange(scope::T,ch=1,rn=8) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.C$ch.VerScale=$(rn/8)")
# Vertical scale
set_vscale(scope::T,ch=1,scal=8) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.C$ch.VerScale=$scal")
# Vertical offset
set_voffs(scope::T,ch=1,offs=0) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.C$ch.VerOffset=$offs")
# Channel coupling
set_coupling(scope::T,ch=1,cpl=1) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.C$ch.Coupling=$cpl")
# Channel enabled
set_ch_state(scope::T,ch=1,st="on") where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.C$ch.View=$st")
# Probe attenuation
set_atten(scope::T,ch=1,att=10) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.C$ch.ProbeAttenuation=$att")
# Screen Gridmode
set_gridmode(scope::T,gridmode="Single") where {T<:LCR6xxx} = write(scope.obj,"VBS app.Display.GridMode=$gridmode")
# Nr of averages
set_nr_avg(scope::T,ch=1,nr=1) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.C$ch.AverageSweeps=$nr")
# EnhanceRes
set_eres(scope::T,ch=1,bits=0) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.C$ch.EnhanceResType=$bits")
# Degauss
degauss(scope::T,ch=1,probe="CP030A") where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.C$ch.InputB.$probe.Degauss")
# Clear sweeps
clear_sweeps(scope::T) where {T<:LCR6xxx} = write(scope.obj,"VBS app.ClearSweeps")
# Nr of acquisition points
function set_nr_pts(scope::T,npts=1e6) where {T<:LCR6xxx} 
	write(scope.obj,"VBS app.Acquisition.Horizontal.Maximize=0")
	write(scope.obj,"VBS app.Acquisition.Horizontal.MaxSamples=$(Int64(npts))")
end
# Sampling rate
function set_srate(scope::T,sr=1e6) where {T<:LCR6xxx} 
	write(scope.obj,"VBS app.Acquisition.Horizontal.Maximize=1")
	write(scope.obj,"VBS app.Acquisition.Horizontal.SampleRate=$(Int64(sr))")
end
# Acquisition duration
set_hduration(scope::T,d=1e-3) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.Horizontal.HorScale=$(d/10)")
# Horizontal offset origin
set_hoffs_div(scope::T,href=1) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.Horizontal.HorOffsetOrigin=$href")

# Set Measurement
function set_meas(scope::T,ch=1,fct="amplitude",par=1,vw=1) where {T<:LCR6xxx}
	write(scope.obj,"VBS app.Measure.P$par.ParamEngine=$fct")
	write(scope.obj,"VBS app.Measure.P$par.Source1=$ch")
	write(scope.obj,"VBS app.Measure.P$par.View=$vw")
end
# Get Measurement
get_meas(scope::T,par=1) where {T<:LCR6xxx} = query(scope.obj,"VBS? Return=app.Measure.P$par.Out.Result.Value")
# Set trigger source
set_trg_src(scope::T,ch=1) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.Trigger.Edge.Source=$ch")
# Set trigger type
set_trg_typ(scope::T,tp=0) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.Trigger.Type=$tp")
# Set trigger mode
set_trg_mode(scope::T,mode=0) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.TriggerMode=$mode")
# Set trigger slope
set_trg_slope(scope::T,slp=0) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.Trigger.Edge.Slope=$slp")
# Set trigger level
set_trg_lev(scope::T,lev=1) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.Trigger.Edge.Level=$lev")
# Set trigger holdoff
set_trg_holdoff(scope::T,hf=1e-9) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.Trigger.Edge.HoldoffTime=$hf")
# Trigger delay time
set_hoffs_t(scope::T,href=1e-3) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.Horizontal.HorOffset=$href")
# Set trigger coupling
set_trg_cpl(scope::T,ch=1,cpl=0) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.Trigger.C$(ch)Coupling=$cpl")
# BW limit
set_bw_lim(scope::T,ch=1,bw=0) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.C$ch.BandwidthLimit=$bw")


# Fetch waveform
function fetch_wfm(scope, ch=1)
valid_wfm_template_name     = "LECROY_2_3"
valid_wfm_template_desc_pos = 17:26
wfm_desc_len                = 346
write(scope.obj, "CHDR OFF") # turn command header Off(no more "VBS" string)
# Manual "LeCroy_wr2_rcm_revb.pdf" page 44ff
# The assumption is that the descriptor is 346 bytes long. The
# length depends on the LeCroy waveform template;the template 
# used to do the asumption is "LECROY_2_3".
	
# Get gain, offset, initial_x and x_increment
gain   = query(scope.obj, "VBS? return=app.Acquisition.C$ch.Out.Result.VerticalPerStep")
gain   = parse(Float64,gain)
offset = query(scope.obj, "VBS? return=app.Acquisition.C$ch.Out.Result.VerticalOffset")
offset = parse(Float64,offset)
initial_x = query(scope.obj, "VBS? return=app.Acquisition.C$ch.Out.Result.HorizontalOffset")
x_increm  = query(scope.obj, "VBS? return=app.Acquisition.C$ch.Out.Result.HorizontalPerStep")

# Prepare scope for waveform reading
write(scope.obj, "CFMT DEF9,WORD,BIN");# Set the format to 16-bit binary block
write(scope.obj, "CORD LO"); # Set the byte order to Little Endian
write(scope.obj, "C$ch:WF? ALL");
# Hint: DAT1 reads data block 1. ALL reads all, inkl
# waveform descriptor. Changed from DAT1 to ALL because some 8
# channel devices did not return measurement data when using
# DAT1. This makes it necessary that the descriptor has to be
# removed from the masurement data.

# Parse header, format: #<length of size field><block size>
while true
	if Instruments.viRead(scope.obj.handle,bufSize = UInt32(1)) == "#"
		break
	end
end

sl = Instruments.viRead(scope.obj.handle,bufSize = UInt32(1))
sl = parse(Float64,sl) # length of size field
sz = Instruments.viRead(scope.obj.handle,bufSize = UInt32(sl))
sz = parse(Int64,sz) # block size

# Read descriptor
desc_buffer = Array{UInt8}(undef,wfm_desc_len)
Instruments.viRead!(scope.obj.handle, desc_buffer)

# Check template version, if not mathing, error out because waveform might be invalid
template_version = String(desc_buffer[valid_wfm_template_desc_pos])
if template_version != valid_wfm_template_name
	error("Template mismatch, invalid waveform!")
end

# Read waveform
sz = sz - wfm_desc_len
y_buffer = Array{UInt8}(undef,Int64(sz))
Instruments.viRead!(scope.obj.handle, y_buffer)

# Read termchar
Instruments.viRead(scope.obj.handle,bufSize = UInt32(1));

# Convert from UInt8 to Int16 (each sample is 2 bytes)
y = reinterpret(Int16,y_buffer)
# Scale and offset
y = y .* gain .+ offset
return y, initial_x, x_increm
end

end #endmodule