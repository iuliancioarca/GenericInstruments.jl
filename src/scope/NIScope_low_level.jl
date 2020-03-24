### GET ATTRIBUTES METHODS
###################################################################################
#ViStatus niScope_GetAttributeViInt32 (ViSession vi, ViConstString channelList, ViAttr attributeID, ViInt32* value);
function niScope_GetAttributeViInt32(scope::T, ch="", attr=1) where {T<:NISCOPE}
	sym    = Libdl.dlsym(lib, :niScope_GetAttributeViInt32)
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	res    = Int32(0)
	pres   = ViPInt32(res)
	status = ccall(sym, ViStatus, 
			(ViSession, ViConstString, ViInt32, ViPInt32), 
			scope.obj, chlist, Int32(attr), pres)
	return (status, niScope_GetError(scope), pres[])
end

#ViStatus niScope_GetAttributeViInt64 (ViSession vi, ViConstString channelList, ViAttr attributeID, ViInt64* value);
function niScope_GetAttributeViInt64(scope::T, ch="", attr=1) where {T<:NISCOPE}
	sym    = Libdl.dlsym(lib, :niScope_GetAttributeViInt64)
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	res    = Int64(0)
	pres   = ViPInt64(res)
	status = ccall(sym, ViStatus, 
			(ViSession, ViConstString, ViInt64, ViPInt64), 
			scope.obj, chlist, Int32(attr), pres)
	return (status, niScope_GetError(scope), pres[])
end

#ViStatus niScope_GetAttributeViReal64 (ViSession vi, ViConstString channelList, ViAttr attributeID, ViReal64* value);
function niScope_GetAttributeViReal64(scope::T, ch="", attr=1) where {T<:NISCOPE}
	sym    = Libdl.dlsym(lib, :niScope_GetAttributeViReal64)
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	res    = Float64(0.0)
	pres   = Ref(res)
	status = ccall(sym, ViStatus, 
			(ViSession, ViConstString, ViInt32, Ref{Cdouble}), 
			scope.obj, chlist, Int32(attr), pres)
	return (status, niScope_GetError(scope), pres[])
end

#ViStatus niScope_GetAttributeViString (ViSession vi, ViConstString channelList, ViAttr attributeID, ViInt32 bufSize, ViChar value[]);
function niScope_GetAttributeViString(scope::T, ch="", attr=1) where {T<:NISCOPE}
	sym    = Libdl.dlsym(lib, :niScope_GetAttributeViString)
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	buffsz = Int32(256)
	res    = zeros(UInt8,buffsz)
	pres   = Ref(res)	
	status = ccall(sym, ViStatus, 
			(ViSession, ViConstString, ViInt32, ViInt32, Ptr{UInt8}), 
			scope.obj, chlist, Int32(attr), buffsz, res);
	return (status, niScope_GetError(scope), pres[])	
end

#ViStatus niScope_GetAttributeViBoolean (ViSession vi, ViConstString channelList, ViAttr attributeID, ViBoolean* value);
function niScope_GetAttributeViBoolean(scope::T, ch="", attr=1) where {T<:NISCOPE}
	sym    = Libdl.dlsym(lib, :niScope_GetAttributeViBoolean)
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	res    = false
	pres   = Ref(res)
	status = ccall(sym, ViStatus, 
			(ViSession, ViConstString, ViInt32, Ref{Bool}), 
			scope.obj, chlist, Int32(attr), pres)
	return (status, niScope_GetError(scope), pres[])
end

#ViStatus niScope_GetAttributeViSession (ViSession vi, ViConstString channelList, ViAttr attributeID, ViSession* value);
function niScope_GetAttributeViSession(scope::T, ch="", attr=1) where {T<:NISCOPE}
	sym    = Libdl.dlsym(lib, :niScope_GetAttributeViSession)
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	res    = ViSession(0)
	pres   = Ref(res)
	status = ccall(sym, ViStatus, 
			(ViSession, ViConstString, ViInt32, ViPSession), 
			scope.obj, chlist, Int32(attr), pres)
	return (status, niScope_GetError(scope), pres[])
end
###################################################################################

### SET ATTRIBUTES METHODS
###################################################################################
#ViStatus niScope_SetAttributeViInt32 (ViSession vi, ViConstString channelList, ViAttr attributeID, ViInt32 value);
function niScope_SetAttributeViInt32(scope::T, ch="", attr=1, val=1) where {T<:NISCOPE}
	sym    = Libdl.dlsym(lib, :niScope_SetAttributeViInt32)
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	status = ccall(sym, ViStatus, 
			(ViSession, ViConstString, ViInt32, ViInt32), 
			scope.obj, chlist, Int32(attr), Int32(val))
	return (status, niScope_GetError(scope))
end

#ViStatus niScope_SetAttributeViInt64 (ViSession vi, ViConstString channelList, ViAttr attributeID, ViInt64 value);
function niScope_SetAttributeViInt64(scope::T, ch="", attr=1, val=1) where {T<:NISCOPE}
	sym    = Libdl.dlsym(lib, :niScope_SetAttributeViInt64)
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	status = ccall(sym, ViStatus, 
			(ViSession, ViConstString, ViInt32, ViInt64), 
			scope.obj, chlist, Int32(attr), Int64(val))
	return (status, niScope_GetError(scope))
end

#ViStatus niScope_SetAttributeViReal64 (ViSession vi, ViConstString channelList, ViAttr attributeID, ViReal64 value);
function niScope_SetAttributeViReal64(scope::T, ch="", attr=1, val=1.0) where {T<:NISCOPE}
	sym    = Libdl.dlsym(lib, :niScope_SetAttributeViReal64)
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	status = ccall(sym, ViStatus, 
			(ViSession, ViConstString, ViInt32, ViReal64), 
			scope.obj, chlist, Int32(attr), Float64(val))
	return (status, niScope_GetError(scope))
end

#ViStatus niScope_SetAttributeViString (ViSession vi, ViConstString channelList, ViAttr attributeID, ViInt32 bufSize, ViChar value[]);
function niScope_SetAttributeViString(scope::T, ch="", attr=1, val=1) where {T<:NISCOPE}
	sym    = Libdl.dlsym(lib, :niScope_SetAttributeViString)
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	val    = [UInt8.(collect(val)); UInt8(0)]
	status = ccall(sym, ViStatus, 
			(ViSession, ViConstString, ViInt32, ViConstString), 
			scope.obj, chlist, Int32(attr), val)
	return (status, niScope_GetError(scope))	
end

#ViStatus niScope_SetAttributeViBoolean (ViSession vi, ViConstString channelList, ViAttr attributeID, ViBoolean value);
function niScope_SetAttributeViBoolean(scope::T, ch="", attr=1, val=false) where {T<:NISCOPE}
	sym    = Libdl.dlsym(lib, :niScope_SetAttributeViBoolean)
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	status = ccall(sym, ViStatus, 
			(ViSession, ViConstString, ViInt32, ViBoolean), 
			scope.obj, chlist, Int32(attr), Bool(val))
	return (status, niScope_GetError(scope))
end

#ViStatus niScope_SetAttributeViSession (ViSession vi, ViConstString channelList, ViAttr attributeID, ViSession value);
function niScope_SetAttributeViSession(scope::T, ch="", attr=1, val=1) where {T<:NISCOPE}
	sym    = Libdl.dlsym(lib, :niScope_SetAttributeViSession)
	chlist = [UInt8.(collect(ch)); UInt8(0)] # terminate with NULL char
	status = ccall(sym, ViStatus, 
			(ViSession, ViConstString, ViInt32, ViSession), 
			scope.obj, chlist, Int32(attr), UInt32(val))
	return (status, niScope_GetError(scope))
end
###################################################################################

## GET ERRORS
###################################################################################
#ViStatus _stdcall niScope_GetError ( ViSession vi , ViStatus * errorCode , ViInt32 bufferSize , ViChar description []);
function niScope_GetError(scope)
	sym    = Libdl.dlsym(lib, :niScope_GetError)
	sts    = Int32(0)
	psts   = Ref(sts)
	buffsz = Int32(256)
	res    = zeros(UInt8,buffsz)
	status = ccall(sym, ViStatus, 
			(ViSession,Ref{Int32}, ViInt32, Ptr{UInt8}), 
			scope.obj, psts, buffsz, res);
	return res=String(Char.(res))
end
###################################################################################


#ERRORS
#define IVI_STATUS_CODE_BASE                    0x3FFA0000L
#define _VI_ERROR           (-2147483647L-1)  /* 0x80000000 */
#define IVI_ERROR_BASE                          (_VI_ERROR + IVI_STATUS_CODE_BASE)
#define IVI_SPECIFIC_ERROR_BASE                 (IVI_ERROR_BASE + 0x4000)
#define NISCOPE_ERROR_SOFTWARE_FAILURE          (IVI_SPECIFIC_ERROR_BASE + 1L)  

#Example:
#ERR_code = _VI_ERROR + IVI_STATUS_CODE_BASE + 0x4000 + offset
#NISCOPE_ERROR_INVALID_FUNCTION_USE=-1074118613; % ((((-2147483647-1) + 0x3FFA0000) + 0x4000)+0x02B)

#offset = -1074118613 - ((((-2147483647-1) + 0x3FFA0000) + 0x4000))
#https://www.pickeringtest.com/de-de/kb/software-topics/other-software-pages/driver-pages/ivi-driver-models-list/ivi-other-error-codes

