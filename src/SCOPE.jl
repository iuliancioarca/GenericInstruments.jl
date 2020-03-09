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
end #endmodule