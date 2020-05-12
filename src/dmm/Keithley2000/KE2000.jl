#
# METHOD TEMPLATES
# basic method template: "This method has priority over the more general T:<Union{....} template"
#set_wfm(fgen::INSTR{:Agilent33500B},func="sinusoid",ch=1) = write(fgen.obj,"SOURce$ch:FUNC $func")
# more general method template, superseded by basic method template
#set_wfm(fgen::T;func="sinusoid",ch=1) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:FUNC $func")

##
# Reset
reset_instr(obj::T) where {T<:KE200x} = write(obj,"*RST")
# Clear
clear_instr(obj::T) where {T<:KE200x} = write(obj,"*CLS;TRACe:CLEar") 
# IDN
get_idn(obj::T) where {T<:KE200x} = query(obj,"*IDN?")


# Function
set_fc(obj::T;fc="VOLT:DC") where {T<:KE200x} = write(obj,"SENS:FUNC '$fc'")
# Function and range
set_fc_range(obj::T;fc="VOLT",rn=10) where {T<:KE200x} = write(obj,"SENS:$fc:RANG $rn")
set_fc_range_auto(obj::T;fc="VOLT") where {T<:KE200x} = write(obj,"SENS:$fc:RANG:AUTO ON")
# Function and NPLC
set_fc_nplc(obj::T;fc="VOLT",nplc=1) where {T<:KE200x} = write(obj,"SENS:$fc:NPLC $nplc")
# Init once
init_meas(obj::T) where {T<:KE200x} = write(obj,":INIT")
# Init continuous
init_meas_continuous(obj::T;st="ON") where {T<:KE200x} = write(obj,":INIT:CONT $st")
# Abort
abort_meas(obj::T) where {T<:KE200x} = write(obj,":INIT")
# Read measurement
function read_meas(obj::T) where {T<:KE200x} # this is broken
	raw  = query(obj,":READ?")
	aux  = split(raw,"N")
	y    = parse(Float64,aux[1])
	return y
end