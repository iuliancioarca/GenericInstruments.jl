NIScope_Measurements_Dict = Dict()
# Base on IVIScope measurement enum
NIScope_Measurements_Dict["RiseTime"]  		   = 0
NIScope_Measurements_Dict["FallTime"]  	 	   = 1
NIScope_Measurements_Dict["Frequency"] 		   = 2
NIScope_Measurements_Dict["Period"]     	   = 3
NIScope_Measurements_Dict["VoltageRMS"] 	   = 4
NIScope_Measurements_Dict["VoltagePeakToPeak"] = 5
NIScope_Measurements_Dict["VoltageMax"]  	   = 6
NIScope_Measurements_Dict["VoltageMin"]  	   = 7
NIScope_Measurements_Dict["VoltageHigh"]  	   = 8
NIScope_Measurements_Dict["VoltageLow"]  	   = 9
NIScope_Measurements_Dict["VoltageAverage"]    = 10
NIScope_Measurements_Dict["WidthNeg"] 		   = 11
NIScope_Measurements_Dict["WidthPos"] 		   = 12
NIScope_Measurements_Dict["DutyCycleNeg"] 	   = 13
NIScope_Measurements_Dict["DutyCyclePos"]      = 14
NIScope_Measurements_Dict["Amplitude"] 		   = 15
NIScope_Measurements_Dict["VoltageCycleRMS"]   = 16
NIScope_Measurements_Dict["VoltageCycleAverage"] = 17
NIScope_Measurements_Dict["OverShoot"] 		   = 18
NIScope_Measurements_Dict["Preshoot"]  		   = 19
# Set Measurement
function set_meas(obj::T;ch::String="1",fct::String="max",par::Int=1,vw::Int=1) where {T<:NIScope}
	error("not implemented yet")
end
# Get Measurement
function get_meas(obj::T;par::Int=1) where {T<:NIScope}
	error("not implemented yet")
end

# Read measurement
# Initiates an acquisition, waits for it to complete, and performs the specified waveform measurement for a single channel and record or for multiple channels and records.
#"""
#meas = niScope_ReadMeasurement(obj::T,ch="1",fct=7) where {T<:NIScope}
#"""
#function niScope_ReadMeasurement(obj::T;ch="",fct=7) where {T<:NIScope}
# niScope_ReadMeasurement (ViSession vi, ViConstString chlist, ViReal64 timeout, ViInt32 scalarMeasFunction, ViReal64* result);
#	chlist = [UInt8.(collect("0")); UInt8(0)] # terminate with NULL char
#	timeout = 0.0
#	result = Ref(0.0)
#	niScope_ReadMeasurement(obj.handle, chlist, timeout, Int32(fct),result)
#	result[]
#end
