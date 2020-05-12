
#
# METHOD TEMPLATES
# basic method template: "This method has priority over the more general T:<Union{....} template"
#set_wfm(fgen::INSTR{:Agilent33500B},func="sinusoid",ch=1) = write(fgen.obj,"SOURce$ch:FUNC $func")
# more general method template, superseded by basic method template
#set_wfm(fgen::T;func="sinusoid",ch=1) where {T<:Union{F332x1,F335x2}} = write(fgen.obj,"SOURce$ch:FUNC $func")

##
# Reset
reset_instr(obj::T) where {T<:Union{E364x1,E364x2}} = write(obj,"*RST")
# Clear
clear_instr(obj::T) where {T<:Union{E364x1,E364x2}} = write(obj,"*CLS") 
# IDN
get_idn(obj::T) where {T<:Union{E364x1,E364x2}} = query(obj,"*IDN?")

## OUTPUT FUNCTION
# Set voltage range
set_range(obj::T;ch::String="1",vrang="low") where {T<:E364x1} = write(obj,"VOLT:RANG $vrang")
set_range(obj::T;ch::String="1",vrang="low") where {T<:E364x2} = write(obj,"INST output$ch;VOLT:RANG $vrang")
# Set output voltage
set_volt(obj::T;ch::String="1",volt=0) where {T<:E364x1} = write(obj,"VOLT $volt")
set_volt(obj::T;ch::String="1",volt=0) where {T<:E364x2} = write(obj,"INST output$ch;VOLT $volt")
# Set compliance (current)
set_compl(obj::T;ch::String="1",crtlim=0) where {T<:E364x1} = write(obj,"CURR $crtlim")
set_compl(obj::T;ch::String="1",crtlim=0) where {T<:E364x2} = write(obj,"INST output$ch;CURR $crtlim")

## OUTPUT
# Set output on/off
set_outp(obj::T;ch::String="1",st="off") where {T<:E364x1} = write(obj,"OUTP $st")
set_outp(obj::T;ch::String="1",st="off") where {T<:E364x2} = write(obj,"INST output$ch;OUTP $st")

# high level example with multiple parameters
#function set_volt_compl(obj::T;ch::String="1",volt=0,crtlim=0.1) where {T<:Union{E364x1,E364x2}}
#	set_volt(psu,ch,volt)
#	sleep(0.1)
#	set_compl(psu,ch,crtlim)
#end

# generic, arbitray number of inputs. WIP
#function set_generic(obj::T;args...) where {T<:Union{E364x1,E364x2}}	
#	args[1](psu,args[2])
#end
