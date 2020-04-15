# template for wfminfo
struct niScope_wfmInfo
	relativeInitialX::Float64
	absoluteInitialX::Float64
	xIncrement::Float64
	actualSamples::Int32
	offset::Float64
	gain::Float64
end

# Fetch wfm
"""
Wrapper over niScope_Fetch, used for compatibility with LecroyHDO6054A
y, wfmInfo[1] = fetch_wfm(scope::T;h::String="0") where {T<:NIScope}
"""
function fetch_wfm(scope::T;ch::String="1") where {T<:NIScope}
	# niScope channels start from 0, so subtract 1
	ch = string(parse(Int64,ch) - 1)
	y, aux = niScope_Fetch(scope;ch)
	return y, aux.absoluteInitialX, aux.xIncrement
end

# one channel at a time...
function niScope_Fetch(scope::T;ch::String="0") where {T<:NIScope}
#ViStatus niScope_Fetch (ViSession vi, ViConstString chlist, ViReal64 timeout, ViInt32 numSamples, ViReal64* wfm, struct niScope_wfmInfo* wfmInfo);
	sym     = Libdl.dlsym(lib, :niScope_Fetch)
	chlist  = [UInt8.(collect("$ch")); UInt8(0)] # terminate with NULL char
	timeout = 0.0
	n_samp  = niScope_ActualRecordLength(scope)
	wfmInfo = [niScope_wfmInfo(0.0, 0.0, 0.0, Int32(0), 1.0, 0.0)] # this needs to be an array of structures, as per niScope documentation
	y       = Vector{Cdouble}(undef, n_samp)# arg type is Ref but one needs to pass the actual array
	status  = ccall(sym, ViStatus,
			(ViSession, ViConstString, ViReal64, ViInt32, Ref{Cdouble}, Ptr{niScope_wfmInfo}),
			scope.obj, chlist, timeout, n_samp, y, wfmInfo)
	return y, wfmInfo[1]
end
