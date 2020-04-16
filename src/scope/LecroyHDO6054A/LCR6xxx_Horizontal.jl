LCR6xxx_Horizontal_Dict = Dict()

# Nr of acquisition points
function set_nr_pts(scope::T;npts=1e6) where {T<:LCR6xxx} 
	write(scope.obj,"VBS app.Acquisition.Horizontal.Maximize=0")
	write(scope.obj,"VBS app.Acquisition.Horizontal.MaxSamples=$(Int64(npts))")
end
# Sampling rate
function set_srate(scope::T;sr=1e6) where {T<:LCR6xxx} 
	write(scope.obj,"VBS app.Acquisition.Horizontal.Maximize=1")
	write(scope.obj,"VBS app.Acquisition.Horizontal.SampleRate=$(Int64(sr))")
end
# Acquisition duration
function set_hduration(scope::T;d=1e-3) where {T<:LCR6xxx}
	write(scope.obj,"VBS app.Acquisition.Horizontal.HorScale=$(d/10)")
end
# Horizontal offset origin
function set_hoffs_div(scope::T;href::Int=1) where {T<:LCR6xxx}
	write(scope.obj,"VBS app.Acquisition.Horizontal.HorOffsetOrigin=$href")
end
