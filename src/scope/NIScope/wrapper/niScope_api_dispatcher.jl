# Methods wrapping the api, allocating buffers, converting strings, etc.

### GET ATTRIBUTES METHODS
###################################################################################
#ViStatus niScope_GetAttributeViInt32 (ViSession vi, ViConstString channelList, ViAttr attributeID, ViInt32* value);
function niScope_GetAttributeViInt32(obj::T, ch="", attr=1) where {T<:NIScope}
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	res    = Int32(0)
	pres   = ViPInt32(res)
	status = niScope_GetAttributeViInt32(obj.handle, chlist, Int32(attr), pres)
	return (status, niScope_GetError(obj), pres[])
end

#ViStatus niScope_GetAttributeViInt64 (ViSession vi, ViConstString channelList, ViAttr attributeID, ViInt64* value);
function niScope_GetAttributeViInt64(obj::T, ch="", attr=1) where {T<:NIScope}
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	res    = Int64(0)
	pres   = ViPInt64(res)
	status = niScope_GetAttributeViInt64(obj.handle, chlist, Int32(attr), pres)		
	return (status, niScope_GetError(obj), pres[])
end

#ViStatus niScope_GetAttributeViReal64 (ViSession vi, ViConstString channelList, ViAttr attributeID, ViReal64* value);
function niScope_GetAttributeViReal64(obj::T, ch="", attr=1) where {T<:NIScope}
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	res    = Float64(0.0)
	pres   = Ref(res)
	status = niScope_GetAttributeViReal64(obj.handle, chlist, Int32(attr), pres)
	return (status, niScope_GetError(obj), pres[])
end

#ViStatus niScope_GetAttributeViString (ViSession vi, ViConstString channelList, ViAttr attributeID, ViInt32 bufSize, ViChar value[]);
function niScope_GetAttributeViString(obj::T, ch="", attr=1) where {T<:NIScope}
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	buffsz = Int32(256)
	res    = zeros(UInt8,buffsz)
	pres   = Ref(res)	
	status = niScope_GetAttributeViString(obj.handle, chlist, Int32(attr), buffsz, res)		
	return (status, niScope_GetError(obj), pres[])	
end

#ViStatus niScope_GetAttributeViBoolean (ViSession vi, ViConstString channelList, ViAttr attributeID, ViBoolean* value);
function niScope_GetAttributeViBoolean(obj::T, ch="", attr=1) where {T<:NIScope}
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	res    = ViBoolean(false)
	pres   = Ref(res)
	status = niScope_GetAttributeViBoolean(obj.handle, chlist, ViAttr(attr), pres)	
	return (status, niScope_GetError(obj), pres[])
end

#ViStatus niScope_GetAttributeViSession (ViSession vi, ViConstString channelList, ViAttr attributeID, ViSession* value);
function niScope_GetAttributeViSession(obj::T, ch="", attr=1) where {T<:NIScope}
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	res    = ViSession(0)
	pres   = Ref(res)
	status = niScope_GetAttributeViSession(obj.handle, chlist, Int32(attr), pres)	
	return (status, niScope_GetError(obj), pres[])
end
###################################################################################

### SET ATTRIBUTES METHODS
###################################################################################
#ViStatus niScope_SetAttributeViInt32 (ViSession vi, ViConstString channelList, ViAttr attributeID, ViInt32 value);
function niScope_SetAttributeViInt32(obj::T, ch="", attr=1, val=1) where {T<:NIScope}
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	status = niScope_SetAttributeViInt32(obj.handle, chlist, Int32(attr), Int32(val))			
	return (status, niScope_GetError(obj))
end

#ViStatus niScope_SetAttributeViInt64 (ViSession vi, ViConstString channelList, ViAttr attributeID, ViInt64 value);
function niScope_SetAttributeViInt64(obj::T, ch="", attr=1, val=1) where {T<:NIScope}
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	status = niScope_SetAttributeViInt64(obj.handle, chlist, Int32(attr), Int64(val))	
	return (status, niScope_GetError(obj))
end

#ViStatus niScope_SetAttributeViReal64 (ViSession vi, ViConstString channelList, ViAttr attributeID, ViReal64 value);
function niScope_SetAttributeViReal64(obj::T, ch="", attr=1, val=1.0) where {T<:NIScope}
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	status = niScope_SetAttributeViReal64(obj.handle, chlist, Int32(attr), Float64(val))	
	return (status, niScope_GetError(obj))
end

#ViStatus niScope_SetAttributeViString (ViSession vi, ViConstString channelList, ViAttr attributeID, ViInt32 bufSize, ViChar value[]);
function niScope_SetAttributeViString(obj::T, ch="", attr=1, val=1) where {T<:NIScope}
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	val    = [UInt8.(collect(val)); UInt8(0)]
	status = niScope_SetAttributeViString(obj.handle, chlist, Int32(attr), val)	
	return (status, niScope_GetError(obj))	
end

#ViStatus niScope_SetAttributeViBoolean (ViSession vi, ViConstString channelList, ViAttr attributeID, ViBoolean value);
function niScope_SetAttributeViBoolean(obj::T, ch="", attr=1, val=false) where {T<:NIScope}
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	status = niScope_SetAttributeViBoolean(obj.handle, chlist, Int32(attr), Bool(val))
	return (status, niScope_GetError(obj))
end

#ViStatus niScope_SetAttributeViSession (ViSession vi, ViConstString channelList, ViAttr attributeID, ViSession value);
function niScope_SetAttributeViSession(obj::T, ch="", attr=1, val=1) where {T<:NIScope}
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	status = niScope_SetAttributeViSession(obj.handle, chlist, Int32(attr), UInt32(val))
	return (status, niScope_GetError(obj))
end
###################################################################################

## GET ERRORS
###################################################################################
#ViStatus _stdcall niScope_GetError ( ViSession vi , ViStatus * errorCode , ViInt32 bufferSize , ViChar description []);
function niScope_GetError(obj)
	sts    = Int32(0)
	psts   = Ref(sts)
	buffsz = Int32(256)
	res    = zeros(UInt8,buffsz)
	status = niScope_GetError(obj.handle, psts, buffsz, res)
	res    = rstrip(String(Char.(res)),['\r', '\n','\0','0'])
	if !isempty(res) # this is brittle
		error(res)
	end
end
