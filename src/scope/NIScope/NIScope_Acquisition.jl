# Fetch wfm
function fetch_wfm(obj::T;ch::String="1") where {T<:NIScope}
	# niScope channels start from 0, so subtract 1
	ch = NIScope_Vertical_Dict[ch]
	y, aux = niScope_Fetch(obj;ch=ch)
	return y, aux.absoluteInitialX, aux.xIncrement
end

# one channel at a time...
function niScope_Fetch(obj::T;ch::String="1") where {T<:NIScope}
#ViStatus niScope_Fetch (ViSession vi, ViConstString channelList, ViReal64 timeout, ViInt32 numSamples, ViReal64* wfm, struct niScope_wfmInfo* wfmInfo);
	chlist  = [UInt8.(collect("$ch")); UInt8(0)] # terminate with NULL char
	timeout = 0.0
	n_samp  = niScope_ActualRecordLength(obj)
	wfmInfo = [niScope_wfmInfo(0.0, 0.0, 0.0, Int32(0), 1.0, 0.0, 0, 0)] # this needs to be an array of structures, as per niScope documentation
	y       = Vector{Cdouble}(undef, n_samp)# arg type is Ref but one needs to pass the actual array
	status  = niScope_Fetch(obj.handle, chlist, timeout, n_samp, y, wfmInfo)
	return y, wfmInfo[1]# return the first wfm in array
end
