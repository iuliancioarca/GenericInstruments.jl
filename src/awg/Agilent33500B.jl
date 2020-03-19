## TRIGGER
# Trigger level
set_trig_lev(fgen::T,ch=1,lev=1) where {T<:F335x2} = write(fgen.obj,"TRIG$ch:LEV$lev")

## OUTPUT FUNCTION
# Duty Cycle
set_duty(fgen::T,ch=1,func="square",duty=0.01) where {T<:F335x2} = write(fgen.obj,"SOURce$ch:FUNC:$func:DCYC $duty")

## SYNC
# Sync Source
set_sync_sour(fgen::T,sour=1) where {T<:F335x2} = write(fgen.obj,"OUTP:SYNC:SOUR ch$sour")
# Sync Polarity
set_sync_pol(fgen::T,ch=1,pol="normal") where {T<:F335x2} = write(fgen.obj,"OUTP$ch:SYNC:POL $pol")
# Phase sync
set_phase_sync(fgen::T,ch=1) where {T<:F335x2} = write(fgen.obj,"SOURce$ch:PHAS:SYNC")

## BURST
# Burst on
set_burst_stat(fgen::T,ch=1,st="off") where {T<:F335x2} = write(fgen.obj,"SOUR$ch:BURS:STAT $st")
# Burst mode
set_burst_mode(fgen::T,ch=1,md="triggered") where {T<:F335x2} = write(fgen.obj,"SOUR$ch:BURS:MODE $md")
# Burst polarity
set_burst_pol(fgen::T,ch=1,pol="normal") where {T<:F335x2} = write(fgen.obj,"SOUR$ch:BURS:GATE:POL $pol")
# Burst ncycles
set_burst_ncyc(fgen::T,ch=1,nc=1) where {T<:F335x2} = write(fgen.obj,"SOUR$ch:BURS:NCYC $nc")
# Burst period
set_burst_per(fgen::T,ch=1,per=0.01) where {T<:F335x2} = write(fgen.obj,"SOUR$ch:BURS:INT:PER $nc")
# Burst phase
set_burst_phase(fgen::T,ch=1,unit="deg",phase=0) where {T<:F335x2} = write(fgen.obj,"UNIT:ANGL $unit\n;SOUR$ch:BURS:PHAS $phase")

## ARBITRARY WAVEFORMS
# Send arb waveform to volatile memory
function send_arb(fgen::T,ch,wfm,dt=1e-6,name="mywfm") where {T<:F335x2}
	write(fgen.obj, "FORM:BORD SWAP")
	arb_bytes = string(length(wfm) * 4)
	arb_bytes_len = string(length(arb_bytes))
	header = "SOURce$ch:DATA:ARBitrary "*name*", #"*arb_bytes_len*arb_bytes
	header = Vector{UInt8}(header)
	binblock_bytes = reinterpret(UInt8, wfm)[:]
	Instruments.viWrite(fgen.obj.handle, [header; binblock_bytes])
end












