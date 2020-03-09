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
# Screen Gridmode
set_gridmode(scope::T,gridmode="Single") where {T<:LCR6xxx} = write(scope.obj,"VBS app.Display.GridMode=$gridmode")
# Nr of averages
set_nr_avg(scope::T,ch=1,nr=1) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.C$ch.AverageSweeps=$nr")
# EnhanceRes
set_eres(scope::T,ch=1,bits=0) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.C$ch.EnhanceResType=$bits")
# Degauss
degauss(scope::T,ch=1,probe="CP030A") where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.C$ch.InputB.$probe.Degauss")
# Clear sweeps
clear_sweeps(scope::T) where {T<:LCR6xxx} = write(scope.obj,"VBS app.ClearSweeps")
# Nr of acquisition points
function set_nr_pts(scope::T,npts=1e6) where {T<:LCR6xxx} 
	write(scope.obj,"VBS app.Acquisition.Horizontal.Maximize=0")
	write(scope.obj,"VBS app.Acquisition.Horizontal.MaxSamples=$(Int64(npts))")
end
# Sampling rate
function set_nr_pts(scope::T,sr=1e6) where {T<:LCR6xxx} 
	write(scope.obj,"VBS app.Acquisition.Horizontal.Maximize=1")
	write(scope.obj,"VBS app.Acquisition.Horizontal.SampleRate=$(Int64(sr))")
end
# Acquisition duration
set_hduration(scope::T,d=1e-3) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.Horizontal.HorScale=$(d/10)")
# Horizontal offset origin
set_hoffs_div(scope::T,href=1) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.Horizontal.HorOffsetOrigin=$href")
# Fetch waveform
function fetch_wfm(scope::T,ch=1) where {T<:LCR6xxx}
npts = query(scope.obj,"VBS? Return=app.Acquisition.Horizontal.NumPoints")
npts = parse(Int64,replace(uppercase(npts),"VBS"=>"")) 
samples = query(scope.obj,"VBS? return=app.Acquisition.C$ch.Out.Result.Samples'")
samples =  parse(Int64, samples)
data = query(scope.obj,"GetScaledWaveformWithTimesC$ch)],samples,0)")
#C1:WAVEFORM?; maybe it works.....
end
# Set Measurement
function set_meas(scope::T,ch=1,fct="amplitude",par=1,vw="on") where {T<:LCR6xxx}
	write(scope.obj,"VBS app.Measure.P$par.ParamEngine=$fct")
	write(scope.obj,"VBS app.Measure.P$par.Source1=C$ch")
	write(scope.obj,"VBS app.Measure.P$par.View=$vw")
end
# Get Measurement
get_meas(scope::T,par=1) where {T<:LCR6xxx} = query(scope.obj,"VBS? Return=app.Measure.P$par.Out.Result.Value")
# Set trigger source
set_trg_src(scope::T,ch=1) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.Trigger.Edge.Source=ch$ch")
# Set trigger type
set_trg_typ(scope::T,tp="edge") where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.Trigger.Type=$tp")
# Set trigger mode
set_trg_mode(scope::T,mode="normal") where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.TriggerMode=$mode")
# Set trigger slope
set_trg_slope(scope::T,ch=1,slp="positive") where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.Trigger.ch$(c)hSlope=$slp")
# Set trigger level
set_trg_lev(scope::T,ch=1,lev=1) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.Trigger.c$(ch)Level=$lev")
# Set trigger holdoff
set_trg_holdoff(scope::T,hf=1e-9) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.Trigger.Edge.HoldoffTime=$hf")
# Trigger delay time
set_hoffs_t(scope::T,href=1e-3) where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.Horizontal.HorOffset=$href")
# Set trigger coupling
set_trg_cpl(scope::T,ch=1,cpl="dc") where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.Trigger.C$(ch)Coupling=$cpl")

# BW limit
set_bw_lim(scope::T,ch=1,bw="full") where {T<:LCR6xxx} = write(scope.obj,"VBS app.Acquisition.C$ch.BandwidthLimit=$bw")




end #endmodule