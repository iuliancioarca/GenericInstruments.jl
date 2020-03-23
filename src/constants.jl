# niScope_64.dll location:
NI_libname = "C:\\Program Files\\IVI Foundation\\IVI\\Bin\\niScope_64"

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


ViInt32     = Int32
ViPInt32    = Ref{Int32}
ViInt64     = Int64
ViPInt64    = Ref{Int64}

ViReal64    = Float64
ViPReal64   = Ref{Float64}

ViBoolean   = Int16


#ViPReal64    = Ref{Array{Float64,1}}










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