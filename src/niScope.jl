using Libdl
# niScope_64.dll location:
NI_libname = "C:\\Program Files\\IVI Foundation\\IVI\\Bin\\niScope_64"
lib = Libdl.dlopen(NI_libname) # Open the library explicitly.
#Libdl.dlclose(lib) # close dll
#sym = Libdl.dlsym(lib, :niScope_init)
#ccall(sym, ...) # Use the pointer `sym` instead of the (symbol, library) tuple
# ccall basic:
# ccall(:func, "dllname", return_type,(input types) ,input arguments)

## Required Vi types:
ViStatus    = Int32
ViSession   = UInt32 # like resource manager rm (de-refferenced pointer)
ViPSession  = Ref{UInt32}
ViString    = Ptr{UInt8}
ViRsrc      = ViString
ViConstString = ViString
ViPFindList = Ref{UInt32}
ViPUInt32   = Ref{UInt32}
ViPByte     = Ref{UInt8}
ViBoolean   = Int16
ViReal64    = Float64
ViInt32     = Int32
ViPInt32    = Ref{Int32}

ViPReal64    = Ref{Array{Float64,1}}

struct niScope_wfmInfo
	relativeInitialX::Float64
	absoluteInitialX::Float64
	xIncrement::Float64
	actualSamples::Int32
	gain::Float64
	offset::Float64
end

############### niSCOPE
# Init
function niScope_init(scope::T) where {T<:NISCOPE}
	sym = Libdl.dlsym(lib, :niScope_init)
	scope_obj_ptr = ViPSession(0)
	scope1_Int = [UInt8.(collect(scope.address)); UInt8(0)] # terminate with NULL char
	status = ccall(sym, ViStatus,
			(ViString, ViBoolean, ViBoolean, ViPSession),
			scope1_Int, Int16(0), Int16(0), scope_obj_ptr)
	scope.obj = scope_obj_ptr[]
	return scope
end
# Auto set
function niScope_AutoSetup(scope::T) where {T<:NISCOPE}
	sym = Libdl.dlsym(lib, :niScope_AutoSetup)
	status = ccall(sym, ViStatus, (ViSession,) ,scope.obj)
end

# Configure vertical
function niScope_ConfigureVertical(scope::T) where {T<:NISCOPE}
# niScope_ConfigureVertical (ViSession vi, ViConstString channelList, ViReal64 range, ViReal64 offset, ViInt32 coupling, ViReal64 probeAttenuation, ViBoolean enabled);
	sym = Libdl.dlsym(lib, :niScope_ConfigureVertical )
	channelList = [UInt8.(collect("0")); UInt8(0)] # terminate with NULL char
	Vrange = 5.0
	Voffset = 0.5
	coupling = Int32(0)
	probeAttenuation = 10.0
	enabled = Int16(1)
	status = ccall(sym, ViStatus, (ViSession,ViConstString, ViReal64, ViReal64, ViInt32, ViReal64, ViBoolean) ,scope.obj, channelList, Vrange, Voffset, coupling, probeAttenuation, enabled)
end

# Configure horizontal
function niScope_ConfigureHorizontalTiming(scope::T,minSampleRate=2e5,
	minNumPts=1000,refPosition=0.1,numRecords=1,enforceRealtime=Int16(1)) where {T<:NISCOPE}
# niScope_ConfigureHorizontalTiming 
	sym = Libdl.dlsym(lib, :niScope_ConfigureHorizontalTiming )
	status = ccall(sym, ViStatus, (ViSession, ViReal64, ViInt32, ViReal64, ViInt32, ViBoolean) ,scope.obj, minSampleRate, minNumPts, refPosition, numRecords, enforceRealtime)
end

# Trigger immediate
function niScope_ConfigureTriggerImmediate(scope::T) where {T<:NISCOPE}
	sym = Libdl.dlsym(lib, :niScope_ConfigureTriggerImmediate)
	status = ccall(sym, ViStatus, (ViSession,) ,scope.obj)
end

# Init acquisition
function niScope_InitiateAcquisition(scope::T) where {T<:NISCOPE}
	sym = Libdl.dlsym(lib, :niScope_InitiateAcquisition)
	status = ccall(sym, ViStatus, (ViSession,) ,scope.obj)
end

# niScope_ActualRecordLength
function niScope_ActualRecordLength(scope::T) where {T<:NISCOPE}
#ViStatus niScope_ActualRecordLength (ViSession vi, ViInt32* recordLength);
	sym = Libdl.dlsym(lib, :niScope_ActualRecordLength)
	res = Int32(0)
	attr_ptr = ViPInt32(res)
	status = ccall(sym, ViStatus, (ViSession,ViPInt32) ,scope.obj,attr_ptr)
	return attr_ptr[]
end

# Fetch wfm 
function fetch_wfm(scope::T,ch=0) where {T<:NISCOPE}
#ViStatus niScope_Fetch (ViSession vi, ViConstString channelList, ViReal64 timeout, ViInt32 numSamples, ViReal64* wfm, struct niScope_wfmInfo* wfmInfo);
	sym = Libdl.dlsym(lib, :niScope_Fetch)
	channelList = [UInt8.(collect("$ch")); UInt8(0)] # terminate with NULL char
	timeout = 0.0
	numSamples = niScope_ActualRecordLength(scope)
	wfmInfo = [niScope_wfmInfo(0.0, 0.0, 0.0, Int32(0), 1.0, 0.0)] # this needs to be an array of structures, as per niScope documentation
	y = Vector{Cdouble}(undef, numSamples)# arg type is Ref but one needs to pass the actual array
	status = ccall(sym, ViStatus, 
			(ViSession, ViConstString, ViReal64, ViInt32, Ref{Cdouble}, Ptr{niScope_wfmInfo}), 
			scope.obj, channelList,timeout,numSamples, y, wfmInfo)
	return y, wfmInfo[1].absoluteInitialX, wfmInfo[1].xIncrement
end

function niScope_ReadMeasurement(scope::T,ch=0,fct=7) where {T<:NISCOPE}
# niScope_ReadMeasurement (ViSession vi, ViConstString channelList, ViReal64 timeout, ViInt32 scalarMeasFunction, ViReal64* result); 
	sym = Libdl.dlsym(lib, :niScope_ReadMeasurement)
	channelList = [UInt8.(collect("0")); UInt8(0)] # terminate with NULL char
	timeout = 0.0
	result = Ref(0.0)
	#fct = 7 # see meas enum below
	status = ccall(sym, ViStatus, (ViSession,ViConstString,ViReal64,ViInt32,Ref{Float64}) ,scope.obj, channelList, timeout, Int32(fct),result) # 5 is for pk-pk, 4 for RMS?
	result[]
end

# close
function niScope_close(scope::T) where {T<:NISCOPE}
	sym = Libdl.dlsym(lib, :niScope_close)
	status = ccall(sym, ViStatus, (ViSession,) ,scope.obj)
	return status
end
	
# niScope_GetAttributeViInt32
#sym = Libdl.dlsym(lib, :niScope_GetAttributeViInt32)
#channelList = [UInt8.(collect("0")); UInt8(0)] # terminate with NULL char
#res = Int32(0)
#attr_ptr = ViPInt32(res)
#status = ccall(sym, ViStatus, 
#		(ViSession, ViConstString, ViInt32, ViPInt32), 
#		scope_obj, channelList, Int32(1250010), attr_ptr)
		
# niScope_GetAttributeViReal64
#sym = Libdl.dlsym(lib, :niScope_GetAttributeViReal64)
#channelList = [UInt8.(collect("0")); UInt8(0)] # terminate with NULL char
#res = 0.0
#attr_ptr = ViReal64(res)
#status = ccall(sym, ViStatus, 
#		(ViSession, ViConstString, ViInt32, ViReal64), 
#		scope_obj, channelList, Int32(1250010), attr_ptr)
		
			

# niScope measurement enums
#IviScopeMeasurementRiseTime(0)
#IviScopeMeasurementFallTime(1)
#IviScopeMeasurementFrequency(2)
#IviScopeMeasurementPeriod(3)
#IviScopeMeasurementVoltageRMS(4)
#IviScopeMeasurementVoltagePeakToPeak(5)
#IviScopeMeasurementVoltageMax(6)
#IviScopeMeasurementVoltageMin(7)
#IviScopeMeasurementVoltageHigh(8)
#IviScopeMeasurementVoltageLow(9)
#IviScopeMeasurementVoltageAverage(10)
#IviScopeMeasurementWidthNeg(11)
#IviScopeMeasurementWidthPos(12)
#IviScopeMeasurementDutyCycleNeg(13)
#IviScopeMeasurementDutyCyclePos(14)
#IviScopeMeasurementAmplitude(15)
#IviScopeMeasurementVoltageCycleRMS(16)
#IviScopeMeasurementVoltageCycleAverage(17)
#IviScopeMeasurementOverShoot(18)
#IviScopeMeasurementPreshoot(19)