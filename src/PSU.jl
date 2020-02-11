module PSU
include("comm_utils.jl")
include("INSTR_TYPES.jl")
# METHOD TEMPLATES
# basic method template: "This method has priority over the more general T:<Union{....} template"
#set_wfm(fgen::INSTR{:Agilent33500B},func="sinusoid",ch=1) = write(fgen.obj,"SOURce$ch:FUNC $func")
# more general method template, superseded by basic method template
#set_wfm(fgen::T,func="sinusoid",ch=1) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:FUNC $func")

# Reset
reset_instr(psu::T) where {T<:Union{E364x1,E364x2}} = write(psu.obj,"*RST")
# Clear
clear_instr(fgen::T) where {T<:Union{E364x1,E364x2}} = write(psu.obj,"*CLS") 
# IDN
get_idn(psu::T) where {T<:Union{E364x1,E364x2}} = query(psu.obj,"*IDN?")
# Set voltage range
set_range(psu::T,ch="output1",vrang="low") where {T<:E364x1} = write(psu.obj,"VOLT:RANG $vrang")
set_range(psu::T,ch="output1",vrang="low") where {T<:E364x2} = write(psu.obj,"INST $ch;VOLT:RANG $vrang")
# Set output voltage
set_volt(psu::T,ch="output1",volt=0) where {T<:E364x1} = write(psu.obj,"VOLT $volt")
set_volt(psu::T,ch="output1",volt=0) where {T<:E364x2} = write(psu.obj,"INST $ch;VOLT $volt")
# Set compliance (current)
set_compl(psu::T,ch="output1",crtlim=0) where {T<:E364x1} = write(psu.obj,"CURR $crtlim")
set_compl(psu::T,ch="output1",crtlim=0) where {T<:E364x2} = write(psu.obj,"INST $ch;CURR $crtlim")
# Set output on/off
set_outp(psu::T,ch="output1",st="off") where {T<:E364x1} = write(psu.obj,"OUTP $st")
set_outp(psu::T,ch="output1",st="off") where {T<:E364x2} = write(psu.obj,"INST $ch;OUTP $st")

# high level example with multiple parameters
function set_volt_compl(psu::T,ch="output1",volt=0,crtlim=0.1) where {T<:Union{E364x1,E364x2}}
	set_volt(psu,ch,volt)
	sleep(0.1)
	set_compl(psu,ch,crtlim)
end

# generic, arbitray number of inputs. WIP
function set_generic(psu::T,args...) where {T<:Union{E364x1,E364x2}}	
	args[1](psu,args[2])
end

end #endmodule