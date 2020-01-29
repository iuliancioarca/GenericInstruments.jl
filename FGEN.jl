include("INSTR_TYPES.jl")
# METHOD TEMPLATES
# basic method template: "This method has priority over the more general T:<Union{....} template"
#set_wfm(fgen::INSTR{:Agilent33500B},func="sinusoid",ch=1) = write(fgen.obj,"SOURce$ch:FUNC $func")
# more general method template, superseded by basic method template
#set_wfm(fgen::T,func="sinusoid",ch=1) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:FUNC $func")

# Reset
reset_instr(fgen::T) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"*RST")
# Clear
clear_instr(fgen::T) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"*CLS")
# IDN
get_idn(fgen::T) where {T<:Union{F332x1,F335x2}} = query(fgen.obj,"*IDN?")

# Trigger functionality
# Trigger source
set_trig_sour(fgen::T,sour="BUS",ch=1) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"TRIG$ch:SOUR $sour")
# Trigger delay
set_trig_del(fgen::T,del=0,ch=1) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"TRIG$ch:DEL $del")
# Trigger level
set_trig_lev(fgen::T,lev=1,ch=1) where {T<:F335x2} = write(fgen.obj,"TRIG$ch:LEV$lev")
# Trigger slope
set_trig_slope(fgen::T,slp="positive",ch=1) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"TRIG$ch:SLOP $slp")
# Waveform
set_wfm(fgen::T,func="sinusoid",ch=1) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:FUNC $func")
# Amplitude
set_amplit(fgen::T,unit="vpp",volt=0.01,ch=1) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:VOLT:UNIT $unit\n;SOURce$ch:VOLT $volt")
