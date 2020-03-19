# Calling niScope from Julia
cd(raw"C:\Program Files\IVI Foundation\IVI\Bin")

using Libdl
NI_libname = "niScope_64"
# niScope_64.dll location:
# doesn't work with full dll path string????
#cd(raw"D:\Documents\Projects\Julia\PXI_control")
lib = Libdl.dlopen(NI_libname) # Open the library explicitly.
#sym = Libdl.dlsym(lib, :niScope_init)
#ccall(sym, ...) # Use the pointer `sym` instead of the (symbol, library) tuple
#Libdl.dlclose(lib) # close dll

# ccall basic:
# ccall(:func, "dllname", return_type,(input types) ,input arguments)
# return type is not critical in this case: Int32 is sufficient for error code
# input and output types are critical for ccall

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

ViPReal64   = Ref{Cdouble}

############### niSCOPE
# INIT
sym = Libdl.dlsym(lib, :niScope_init)
scope_obj_ptr = ViPSession(0)
scope1     = "PXI1Slot3"
scope1_Int = [UInt8.(collect(scope1)); UInt8(0)] # terminate with NULL char
status = ccall(sym, ViStatus,
        (ViString, ViBoolean, ViBoolean, ViPSession),
        scope1_Int, Int16(0), Int16(0), scope_obj_ptr)
scope_obj = scope_obj_ptr[]

# auto set
sym = Libdl.dlsym(lib, :niScope_AutoSetup)
status = ccall(sym, ViStatus, (ViSession,) ,scope_obj)

# niScope_ConfigureVertical (ViSession vi, ViConstString channelList, ViReal64 range, ViReal64 offset, ViInt32 coupling, ViReal64 probeAttenuation, ViBoolean enabled);
sym = Libdl.dlsym(lib, :niScope_ConfigureHorizontalTiming )
channelList = [UInt8.(collect("0")); UInt8(0)] # terminate with NULL char
Vrange = 5.0
Voffset = 0.5
coupling = Int32(0)
probeAttenuation = 10.0
enabled = Int16(1)

status = ccall(sym, ViStatus, (ViSession,ViConstString, ViReal64, ViReal64, ViInt32, ViReal64, ViBoolean) ,scope_obj, channelList, Vrange, Voffset, coupling, probeAttenuation, enabled)


# niScope_ConfigureHorizontalTiming 
sym = Libdl.dlsym(lib, :niScope_ConfigureHorizontalTiming )
minSampleRate = 2e5
minNumPts = 100000
refPosition = 0.1
numRecords = 1
enforceRealtime = Int16(1)
status = ccall(sym, ViStatus, (ViSession, ViReal64, ViInt32, ViReal64, ViInt32, ViBoolean) ,scope_obj, minSampleRate, minNumPts, refPosition, numRecords, enforceRealtime)

# trigger immediate
sym = Libdl.dlsym(lib, :niScope_ConfigureTriggerImmediate)
status = ccall(sym, ViStatus, (ViSession,) ,scope_obj)

# init acq
sym = Libdl.dlsym(lib, :niScope_InitiateAcquisition)
status = ccall(sym, ViStatus, (ViSession,) ,scope_obj)

# fetch wfm
#ViStatus niScope_Fetch (ViSession vi, ViConstString channelList, ViReal64 timeout, ViInt32 numSamples, ViReal64* wfm, struct niScope_wfmInfo* wfmInfo);
sym = Libdl.dlsym(lib, :niScope_Fetch)
channelList = [UInt8.(collect("0")); UInt8(0)] # terminate with NULL char
timeout = 0.0
npts = 1000
numSamples = Int32(npts)

struct niScope_wfmInfo
	relativeInitialX::Float64
	absoluteInitialX::Float64
	xIncrement::Float64
	actualSamples::Int32
	gain::Float64
	offset::Float64
end

wfmInfo = [niScope_wfmInfo(0.0, 0.0, 0.0, Int32(0), 1.0, 0.0)] # this needs to be an array of structures, as per niScope documentation
wfm = Vector{Cdouble}(undef, npts)# arg type is Ref but one needs to pass the actual array

status = ccall(sym, ViStatus, (ViSession, ViConstString, ViReal64, ViInt32, Ref{Cdouble}, Ptr{niScope_wfmInfo}) ,scope_obj, channelList,timeout,numSamples, wfm, wfmInfo)


# niScope_ReadMeasurement (ViSession vi, ViConstString channelList, ViReal64 timeout, ViInt32 scalarMeasFunction, ViReal64* result); 
sym = Libdl.dlsym(lib, :niScope_ReadMeasurement)
channelList = [UInt8.(collect("0")); UInt8(0)] # terminate with NULL char
timeout = 0.0
result = Ref(0.0)
fct = 7 # see meas enum below

status = ccall(sym, ViStatus, (ViSession,ViConstString,ViReal64,ViInt32,Ref{Float64}) ,scope_obj, channelList, timeout, Int32(fct),result) # 5 is for pk-pk, 4 for RMS?
result[]


# close
sym = Libdl.dlsym(lib, :niScope_close)
status = ccall(sym, ViStatus, (ViSession,) ,scope_obj)


############### niDMM
dmm_obj_ptr = ViPSession(0)

dmm1     = "PXI1Slot5"

dmm1_Int = [UInt8.(collect(dmm1)); UInt8(0)] # terminate with NULL char

status = ccall((:niDmm_init, NI_libname), ViStatus,
        (ViString, ViBoolean, ViBoolean, ViPSession),
        scope1_Int, Int16(0), Int16(0), dmm_obj_ptr)
		
		
		
		
# niScope measurement enums
		IviScopeMeasurementRiseTime(0)
		IviScopeMeasurementFallTime(1)
		IviScopeMeasurementFrequency(2)
		IviScopeMeasurementPeriod(3)
		IviScopeMeasurementVoltageRMS(4)
		IviScopeMeasurementVoltagePeakToPeak(5)
		IviScopeMeasurementVoltageMax(6)
		IviScopeMeasurementVoltageMin(7)
		IviScopeMeasurementVoltageHigh(8)
		IviScopeMeasurementVoltageLow(9)
		IviScopeMeasurementVoltageAverage(10)
		IviScopeMeasurementWidthNeg(11)
		IviScopeMeasurementWidthPos(12)
		IviScopeMeasurementDutyCycleNeg(13)
		IviScopeMeasurementDutyCyclePos(14)
		IviScopeMeasurementAmplitude(15)
		IviScopeMeasurementVoltageCycleRMS(16)
		IviScopeMeasurementVoltageCycleAverage(17)
		IviScopeMeasurementOverShoot(18)
		IviScopeMeasurementPreshoot(19)
