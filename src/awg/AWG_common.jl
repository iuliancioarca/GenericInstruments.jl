# METHOD TEMPLATES
# basic method template: "This method has priority over the more general T:<Union{....} template"
#set_wfm(fgen::INSTR{:Agilent33500B},func="sin",ch=1) = write(fgen.obj,"SOURce$ch:FUNC $func")
# more general method template, superseded by basic method template
#set_wfm(fgen::T;func="sin",ch=1) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:FUNC $func")

## 
# Reset
reset_instr(fgen::T) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"*RST")
# Clear
clear_instr(fgen::T) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"*CLS")
# IDN
get_idn(fgen::T) where {T<:Union{F332x1,F335x2}} = query(fgen.obj,"*IDN?")

## TRIGGER
# Trigger source
set_trig_sour(fgen::T;ch=1,sour="BUS") where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"TRIG$ch:SOUR $sour")
# Trigger delay
set_trig_del(fgen::T;ch=1,del=0) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"TRIG$ch:DEL $del")
# Trigger slope
set_trig_slope(fgen::T;ch=1,slp="positive") where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"TRIG$ch:SLOP $slp")
# Output trigger state
set_out_trig_stat(fgen::T;st="normal") where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"OUTP:TRIG $st")
# Output trigger slope
set_out_trig_slope(fgen::T;slp="positive") where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"OUTP:TRIG:SLOP $slp")
# Software trigger
send_soft_trig(fgen::T) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"*TRG")

## OUTPUT FUNCTION
# Waveform
set_wfm(fgen::T;ch=1,func="sin") where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:FUNC $func")
# ARB Waveform
set_arb_wfm(fgen::T;ch=1,arb="mywfm") where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:FUNCtion:ARBitrary $arb")
# Amplitude
set_amplit(fgen::T;ch=1,unit="vpp",volt=0.01) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:VOLT:UNIT $unit\n;SOURce$ch:VOLT $volt")
# Offset
set_offs(fgen::T;ch=1,volt=0.01) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:VOLT:OFFset $volt")
# High Level
set_hilev(fgen::T;ch=1,volt=0.01) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:VOLT:HIGH $volt")
# Low Level
set_lolev(fgen::T;ch=1,volt=0.01) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:VOLT:LOW $volt")
# Frequency
set_freq(fgen::T;ch=1,fr=1000) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:FREQ $fr")
# Period
set_per(fgen::T;ch=1,func="sin",per=0.001) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:FUNC:$func:PER $per")
# Phase
set_phase(fgen::T;ch=1,unit="deg",phase=90) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"UNIT:ANGL $unit\n;SOURce$ch:PHAS $phase")
# Symmetry
set_sym(fgen::T;ch=1,func="ramp",sym=50) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:FUNC:$func:SYMM $sym")
# Both Edge times
set_both_edg(fgen::T;ch=1,func="pulse",dt=10e-9) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:FUNC:$func:TRAN $dt")
# Lead Edge time
set_lead_edg(fgen::T;ch=1,func="pulse",dt=10e-9) where {T<:F335x2} = write(fgen.obj,"SOURce$ch:FUNC:$func:TRAN:LEAD $dt")
# Trail Edge time
set_trail_edg(fgen::T;ch=1,func="pulse",dt=10e-9) where {T<:F335x2} = write(fgen.obj,"SOURce$ch:FUNC:$func:TRAN:TRA $dt")
# Width
set_width(fgen::T;ch=1,func="pulse",wd=1e-4) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:FUNC:$func:WIDTh $wd")

## OUTPUT
# Output Load
set_load(fgen::T;ch=1,load="INF") where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"OUTP$ch:LOAD $load")
# Output Polarity
set_pol(fgen::T;ch=1,pol="normal") where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"OUTP$ch:POL $pol")
# Output on/off
set_outp(fgen::T;ch=1,st="off") where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"OUTP$ch $st")

## SYNC
# Sync state
set_sync_stat(fgen::T;ch=1,st="on") where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"OUTP$ch:SYNC $st")

# Beeper
set_beep(fgen::T;st="off") where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SYST:BEEP:STAT $st")
# Query action completed
query_complete(fgen::T) where {T<:Union{F332x1,F335x2}} = query(fgen.obj,"*OPC?")
# Wait for action to complete
wait_complete(fgen::T) where {T<:Union{F332x1,F335x2}} = query(fgen.obj,"*WAI")
# Read error
query_error(fgen::T) where {T<:Union{F332x1,F335x2}} = query(fgen.obj,"SYST:ERR?")

## ARBITRARY WAVEFORMS
# Arb sample rate
set_sample_rate(fgen::T;ch=1,srate=1e6) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:FUNC:ARB:SRAT $srate")
# Clear all arbs from volatile memory
clear_arbs(fgen::T;ch=1) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:DATA:VOLatile:CLEar")


