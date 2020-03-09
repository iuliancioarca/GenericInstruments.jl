module DMM
include("comm_utils.jl")
include("INSTR_TYPES.jl")
# METHOD TEMPLATES
# basic method template: "This method has priority over the more general T:<Union{....} template"
#set_wfm(fgen::INSTR{:Agilent33500B},func="sinusoid",ch=1) = write(fgen.obj,"SOURce$ch:FUNC $func")
# more general method template, superseded by basic method template
#set_wfm(fgen::T,func="sinusoid",ch=1) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:FUNC $func")

# Reset
reset_instr(dmm::T) where {T<:KE200x} = write(dmm.obj,"*RST")
# Clear
clear_instr(dmm::T) where {T<:KE200x} = write(dmm.obj,"*CLS;'TRACe:CLEar'") 
# IDN
get_idn(dmm::T) where {T<:KE200x} = query(dmm.obj,"*IDN?")
# Function and range
set_fc_range(dmm::T,fc="voltage",rn="auto") where {T<:KE200x} = write(dmm.obj,"SENS:$fc:RANG $rn")

end #endmodule