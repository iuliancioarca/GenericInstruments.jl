NIScope_Measurements_Dict = Dict()
# Base on IVIScope measurement enum
NIScope_Measurements_Dict["RiseTime"]  		   = 0
NIScope_Measurements_Dict["FallTime"]  	 	   = 1
NIScope_Measurements_Dict["Frequency"] 		   = 2
NIScope_Measurements_Dict["Period"]     	   = 0
NIScope_Measurements_Dict["VoltageRMS"] 	   = 1
NIScope_Measurements_Dict["VoltagePeakToPeak"] = 2
NIScope_Measurements_Dict["VoltageMin"]  	   = 0
NIScope_Measurements_Dict["VoltageHigh"]  	   = 1
NIScope_Measurements_Dict["VoltageLow"]  	   = 2
NIScope_Measurements_Dict["VoltageAverage"]    = 0
NIScope_Measurements_Dict["WidthNeg"] 		   = 1
NIScope_Measurements_Dict["WidthPos"] 		   = 2
NIScope_Measurements_Dict["DutyCycleNeg"] 	   = 0
NIScope_Measurements_Dict["CyclePos"] 		   = 1
NIScope_Measurements_Dict["Duty"] 			   = 2
NIScope_Measurements_Dict["Amplitude"] 		   = 0
NIScope_Measurements_Dict["VoltageCycleRMS"]   = 1
NIScope_Measurements_Dict["VoltageCycleAverage"] = 2
NIScope_Measurements_Dict["OverShoot"] 		   = 1
NIScope_Measurements_Dict["Preshoot"]  		   = 2
# Set Measurement
function set_meas(scope::T;ch::String="1",fct::String="max",par::Int=1,vw::Int=1) where {T<:NIScope}
	error("not implemented yet")
end
# Get Measurement
function get_meas(scope::T;par::Int=1) where {T<:NIScope}
	error("not implemented yet")
end

# Read measurement
# Initiates an acquisition, waits for it to complete, and performs the specified waveform measurement for a single channel and record or for multiple channels and records.
"""
meas = niScope_ReadMeasurement(scope::T,ch=0,fct=7) where {T<:NIScope}
"""
function niScope_ReadMeasurement(scope::T;ch=0,fct=7) where {T<:NIScope}
# niScope_ReadMeasurement (ViSession vi, ViConstString chlist, ViReal64 timeout, ViInt32 scalarMeasFunction, ViReal64* result);
	sym = Libdl.dlsym(lib, :niScope_ReadMeasurement)
	chlist = [UInt8.(collect("0")); UInt8(0)] # terminate with NULL char
	timeout = 0.0
	result = Ref(0.0)
	#fct = 7 # see meas enum below
	status = ccall(sym, ViStatus, (ViSession,ViConstString,ViReal64,ViInt32,Ref{Float64}) ,scope.obj, chlist, timeout, Int32(fct),result) # 5 is for pk-pk, 4 for RMS?
	result[]
end
