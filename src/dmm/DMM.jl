module DMM
using Instruments
include("..\\INSTR_TYPES.jl")
include("..\\comm_utils.jl")
#
# METHOD TEMPLATES
# basic method template: "This method has priority over the more general T:<Union{....} template"
#set_wfm(fgen::INSTR{:Agilent33500B},func="sinusoid",ch=1) = write(fgen.obj,"SOURce$ch:FUNC $func")
# more general method template, superseded by basic method template
#set_wfm(fgen::T;func="sinusoid",ch=1) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:FUNC $func")

##
# Reset
reset_instr(dmm::T) where {T<:KE200x} = write(dmm.obj,"*RST")
# Clear
clear_instr(dmm::T) where {T<:KE200x} = write(dmm.obj,"*CLS;TRACe:CLEar") 
# IDN
get_idn(dmm::T) where {T<:KE200x} = query(dmm.obj,"*IDN?")


# Function
set_fc(dmm::T;fc="VOLT:DC") where {T<:KE200x} = write(dmm.obj,"SENS:FUNC '$fc'")
# Function and range
set_fc_range(dmm::T;fc="VOLT",rn=10) where {T<:KE200x} = write(dmm.obj,"SENS:$fc:RANG $rn")
set_fc_range_auto(dmm::T;fc="VOLT") where {T<:KE200x} = write(dmm.obj,"SENS:$fc:RANG:AUTO ON")
# Function and NPLC
set_fc_nplc(dmm::T;fc="VOLT",nplc=1) where {T<:KE200x} = write(dmm.obj,"SENS:$fc:NPLC $nplc")
# Init once
init_meas(dmm::T) where {T<:KE200x} = write(dmm.obj,":INIT")
# Init continuous
init_meas_continuous(dmm::T;st="ON") where {T<:KE200x} = write(dmm.obj,":INIT:CONT $st")
# Abort
abort_meas(dmm::T) where {T<:KE200x} = write(dmm.obj,":INIT")
# Read measurement
function read_meas(dmm::T) where {T<:KE200x} 
	raw  = query(dmm.obj,":READ?")
	aux  =  split(raw,"N")
	y    = parse(Float64,aux[1])
	unit = split(aux[2],",")
	return y, unit[1]
end
end #endmodule