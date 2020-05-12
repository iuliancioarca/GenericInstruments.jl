# METHOD TEMPLATES
# basic method template: "This method has priority over the more general T:<Union{....} template"
#set_wfm(obj::INSTR{:Agilent33500B},func="sin",ch="1") = write(obj,"SOURce$ch:FUNC $func")
# more general method template, superseded by basic method template
#set_wfm(obj::T;func="sin",ch="1") where {T<:Union{F332x1,F335x2}} = write(obj,"SOURce$ch:FUNC $func")

## 
# Reset
reset_instr(obj::T) where {T<:Union{F332x1,F335x2}} = write(obj,"*RST")
# Clear
clear_instr(obj::T) where {T<:Union{F332x1,F335x2}} = write(obj,"*CLS")
# IDN
get_idn(obj::T) where {T<:Union{F332x1,F335x2}} = query(obj,"*IDN?")

## TRIGGER
# Trigger source
set_trig_sour(obj::T;ch="1",sour="BUS") where {T<:Union{F332x1,F335x2}} = write(obj,"TRIG$ch:SOUR $sour")
# Trigger delay
set_trig_del(obj::T;ch="1",del=0) where {T<:Union{F332x1,F335x2}} = write(obj,"TRIG$ch:DEL $del")
# Trigger slope
set_trig_slope(obj::T;ch="1",slp="positive") where {T<:Union{F332x1,F335x2}} = write(obj,"TRIG$ch:SLOP $slp")
# Output trigger state
set_out_trig_stat(obj::T;st="normal") where {T<:Union{F332x1,F335x2}} = write(obj,"OUTP:TRIG $st")
# Output trigger slope
set_out_trig_slope(obj::T;slp="positive") where {T<:Union{F332x1,F335x2}} = write(obj,"OUTP:TRIG:SLOP $slp")
# Software trigger
send_soft_trig(obj::T) where {T<:Union{F332x1,F335x2}} = write(obj,"*TRG")

## OUTPUT FUNCTION
# Waveform
set_wfm(obj::T;ch="1",func="sin") where {T<:Union{F332x1,F335x2}} = write(obj,"SOURce$ch:FUNC $func")
# ARB Waveform
set_arb_wfm(obj::T;ch="1",arb="mywfm") where {T<:Union{F332x1,F335x2}} = write(obj,"SOURce$ch:FUNCtion:ARBitrary $arb")
# Amplitude
set_amplit(obj::T;ch="1",unit="vpp",volt=0.01) where {T<:Union{F332x1,F335x2}} = write(obj,"SOURce$ch:VOLT:UNIT $unit\n;SOURce$ch:VOLT $volt")
# Offset
set_offs(obj::T;ch="1",volt=0.01) where {T<:Union{F332x1,F335x2}} = write(obj,"SOURce$ch:VOLT:OFFset $volt")
# High Level
set_hilev(obj::T;ch="1",volt=0.01) where {T<:Union{F332x1,F335x2}} = write(obj,"SOURce$ch:VOLT:HIGH $volt")
# Low Level
set_lolev(obj::T;ch="1",volt=0.01) where {T<:Union{F332x1,F335x2}} = write(obj,"SOURce$ch:VOLT:LOW $volt")
# Frequency
set_freq(obj::T;ch="1",fr=1000) where {T<:Union{F332x1,F335x2}} = write(obj,"SOURce$ch:FREQ $fr")
# Period
set_per(obj::T;ch="1",func="sin",per=0.001) where {T<:Union{F332x1,F335x2}} = write(obj,"SOURce$ch:FUNC:$func:PER $per")
# Phase
set_phase(obj::T;ch="1",unit="deg",phase=90) where {T<:Union{F332x1,F335x2}} = write(obj,"UNIT:ANGL $unit\n;SOURce$ch:PHAS $phase")
# Symmetry
set_sym(obj::T;ch="1",func="ramp",sym=50) where {T<:Union{F332x1,F335x2}} = write(obj,"SOURce$ch:FUNC:$func:SYMM $sym")
# Both Edge times
set_both_edg(obj::T;ch="1",func="pulse",dt=10e-9) where {T<:Union{F332x1,F335x2}} = write(obj,"SOURce$ch:FUNC:$func:TRAN $dt")
# Lead Edge time
set_lead_edg(obj::T;ch="1",func="pulse",dt=10e-9) where {T<:F335x2} = write(obj,"SOURce$ch:FUNC:$func:TRAN:LEAD $dt")
# Trail Edge time
set_trail_edg(obj::T;ch="1",func="pulse",dt=10e-9) where {T<:F335x2} = write(obj,"SOURce$ch:FUNC:$func:TRAN:TRA $dt")
# Width
set_width(obj::T;ch="1",func="pulse",wd=1e-4) where {T<:Union{F332x1,F335x2}} = write(obj,"SOURce$ch:FUNC:$func:WIDTh $wd")

## OUTPUT
# Output Load
set_load(obj::T;ch="1",load="INF") where {T<:Union{F332x1,F335x2}} = write(obj,"OUTP$ch:LOAD $load")
# Output Polarity
set_pol(obj::T;ch="1",pol="normal") where {T<:Union{F332x1,F335x2}} = write(obj,"OUTP$ch:POL $pol")
# Output on/off
set_outp(obj::T;ch="1",st="off") where {T<:Union{F332x1,F335x2}} = write(obj,"OUTP$ch $st")

## SYNC
# Sync state
set_sync_stat(obj::T;ch="1",st="on") where {T<:Union{F332x1,F335x2}} = write(obj,"OUTP$ch:SYNC $st")

# Beeper
set_beep(obj::T;st="off") where {T<:Union{F332x1,F335x2}} = write(obj,"SYST:BEEP:STAT $st")
# Query action completed
query_complete(obj::T) where {T<:Union{F332x1,F335x2}} = query(obj,"*OPC?")
# Wait for action to complete
wait_complete(obj::T) where {T<:Union{F332x1,F335x2}} = query(obj,"*WAI")
# Read error
query_error(obj::T) where {T<:Union{F332x1,F335x2}} = query(obj,"SYST:ERR?")

## ARBITRARY WAVEFORMS
# Arb sample rate
set_sample_rate(obj::T;ch="1",srate=1e6) where {T<:Union{F332x1,F335x2}} = write(obj,"SOURce$ch:FUNC:ARB:SRAT $srate")
# Clear all arbs from volatile memory
clear_arbs(obj::T;ch="1") where {T<:Union{F332x1,F335x2}} = write(obj,"SOURce$ch:DATA:VOLatile:CLEar")


