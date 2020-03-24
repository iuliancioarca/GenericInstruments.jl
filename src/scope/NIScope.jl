lib = Libdl.dlopen(NI_libname) # Open the library explicitly.
#Libdl.dlclose(lib) # close dll
#sym = Libdl.dlsym(lib, :niScope_init)
#ccall(sym, ...) # Use the pointer `sym` instead of the (symbol, library) tuple
# ccall basic:
# ccall(:func, "dllname", return_type,(input types) ,input arguments)

struct niScope_wfmInfo
	relativeInitialX::Float64
	absoluteInitialX::Float64
	xIncrement::Float64
	actualSamples::Int32
	offset::Float64
	gain::Float64
end

############### niSCOPE
#
"""
scope = niScope_init(scope::T) where {T<:NISCOPE}
scope is a mutable struct of type:
mutable struct INSTR{instr_name}
    name::Symbol
    address::String
    obj
end
"""
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

# close
"""
status = niScope_close(scope::T) where {T<:NISCOPE}
"""
function niScope_close(scope::T) where {T<:NISCOPE}
	sym    = Libdl.dlsym(lib, :niScope_close)
	status = ccall(sym, ViStatus, (ViSession,) ,scope.obj)
	return status
end

# Auto set
"""
status = niScope_AutoSetup(scope::T) where {T<:NISCOPE}
"""
function niScope_AutoSetup(scope::T) where {T<:NISCOPE}
	sym    = Libdl.dlsym(lib, :niScope_AutoSetup)
	status = ccall(sym, ViStatus, (ViSession,) ,scope.obj)
end


# Trigger immediate
"""
status = niScope_ConfigureTriggerImmediate(scope::T) where {T<:NISCOPE}
"""
function niScope_ConfigureTriggerImmediate(scope::T) where {T<:NISCOPE}
	sym = Libdl.dlsym(lib, :niScope_ConfigureTriggerImmediate)
	status = ccall(sym, ViStatus, (ViSession,) ,scope.obj)
end

# Init acquisition
"""
status = niScope_InitiateAcquisition(scope::T) where {T<:NISCOPE}
"""
function niScope_InitiateAcquisition(scope::T) where {T<:NISCOPE}
	sym = Libdl.dlsym(lib, :niScope_InitiateAcquisition)
	status = ccall(sym, ViStatus, (ViSession,) ,scope.obj)
end

# niScope_ActualRecordLength
"""
record_length = niScope_ActualRecordLength(scope::T) where {T<:NISCOPE}
"""
function niScope_ActualRecordLength(scope::T) where {T<:NISCOPE}
#ViStatus niScope_ActualRecordLength (ViSession vi, ViInt32* recordLength);
	sym    = Libdl.dlsym(lib, :niScope_ActualRecordLength)
	res    = Int32(0)
	pres   = ViPInt32(res)
	status = ccall(sym, ViStatus, (ViSession,ViPInt32) ,scope.obj,pres)
	return pres[]
end

# Fetch wfm
"""
y, wfmInfo[1] = fetch_wfm(scope::T;ch=0) where {T<:NISCOPE}
"""
function fetch_wfm(scope::T;ch=0) where {T<:NISCOPE}
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

# Fetch measurement
"""
meas = niScope_ReadMeasurement(scope::T,ch=0,fct=7) where {T<:NISCOPE}
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

"""
function niScope_ReadMeasurement(scope::T;ch=0,fct=7) where {T<:NISCOPE}
# niScope_ReadMeasurement (ViSession vi, ViConstString chlist, ViReal64 timeout, ViInt32 scalarMeasFunction, ViReal64* result);
	sym = Libdl.dlsym(lib, :niScope_ReadMeasurement)
	chlist = [UInt8.(collect("0")); UInt8(0)] # terminate with NULL char
	timeout = 0.0
	result = Ref(0.0)
	#fct = 7 # see meas enum below
	status = ccall(sym, ViStatus, (ViSession,ViConstString,ViReal64,ViInt32,Ref{Float64}) ,scope.obj, chlist, timeout, Int32(fct),result) # 5 is for pk-pk, 4 for RMS?
	result[]
end

