NIScope_Vertical_Dict = Dict()
# Set trigger source, niScope channels start from 0, so subtract 1
NIScope_Vertical_Dict["1"]   = "0"
NIScope_Vertical_Dict["2"]   = "1"
NIScope_Vertical_Dict["3"]   = "2"
NIScope_Vertical_Dict["4"]   = "3"
# Channel enabled
NIScope_Vertical_Dict["on"]  = true
NIScope_Vertical_Dict["off"] = false
# Channel coupling
NIScope_Vertical_Dict["ac"]  = 0
NIScope_Vertical_Dict["dc"]  = 1
NIScope_Vertical_Dict["gnd"] = 2
# Probe attenuation
NIScope_Vertical_Dict["10x"]  = 10
NIScope_Vertical_Dict["100x"] = 100
# BW limit
#NISCOPE_VAL_BANDWIDTH_DEVICE_DEFAULT (0.0)
#NISCOPE_VAL_20MHZ_BANDWIDTH (20000000.0)
#NISCOPE_VAL_100MHZ_BANDWIDTH (100000000.0)
#NISCOPE_VAL_20MHZ_MAX_INPUT_FREQUENCY (20000000.0)
#NISCOPE_VAL_100MHZ_MAX_INPUT_FREQUENCY (100000000.0)
NIScope_Vertical_Dict["full"]    = -1.0
NIScope_Vertical_Dict["default"] = 0.0
NIScope_Vertical_Dict["20MHz"]   = 20000000.0
NIScope_Vertical_Dict["100MHz"]  = 100000000.0

# EnhanceRes
NIScope_Vertical_Dict["0b"]   = 0
NIScope_Vertical_Dict["0.5b"] = 1
NIScope_Vertical_Dict["1b"]   = 2
NIScope_Vertical_Dict["1.5b"] = 3
NIScope_Vertical_Dict["2b"]   = 4
NIScope_Vertical_Dict["2.5b"] = 5
NIScope_Vertical_Dict["3b"]   = 6

# Channel enabled
function set_state(scope::T;ch::String="1",st::String="on") where {T<:NIScope}
	NISCOPE_ATTR_CHANNEL_ENABLED=1250005; # ((1000000 + 250000) + 5)
	ch = NIScope_Vertical_Dict[ch]
	st = NIScope_Vertical_Dict[st]
	status = niScope_SetAttributeViBoolean(scope, ch, NISCOPE_ATTR_CHANNEL_ENABLED, st)
end
# Channel input impedance
function set_input_impedance(scope::T;ch::String="1",val::String="1M") where {T<:NIScope}
	error("not implemented yet")
end
# Channel coupling
function set_coupling(scope::T;ch::String="1",cpl::String="dc") where {T<:NIScope}
	NISCOPE_ATTR_VERTICAL_COUPLING = 1250003; # ((1000000 + 250000) + 3)
	ch  = NIScope_Vertical_Dict[ch]
	cpl = NIScope_Vertical_Dict[cpl]
	status = niScope_SetAttributeViInt32(scope, ch, NISCOPE_ATTR_VERTICAL_COUPLING, cpl)
end
# Probe attenuation
function set_atten(scope::T;ch::String="1",att::String="10x") where {T<:NIScope}
	NISCOPE_ATTR_PROBE_ATTENUATION=1250004; # ((1000000 + 250000) + 4)
	ch  = NIScope_Vertical_Dict[ch]
	att = NIScope_Vertical_Dict[att]
	status = niScope_SetAttributeViReal64(scope, ch, NISCOPE_ATTR_PROBE_ATTENUATION, Float64(att))
end
# BW limit
function set_bw_lim(scope::T;ch::String="1",bw::String="full") where {T<:NIScope}
	NISCOPE_ATTR_MAX_INPUT_FREQUENCY=1250006; # ((1000000 + 250000) + 6)
	ch = NIScope_Vertical_Dict[ch]
	bw = NIScope_Vertical_Dict[bw]
	status = niScope_SetAttributeViReal64(scope, ch, NISCOPE_ATTR_MAX_INPUT_FREQUENCY, Float64(bw))
end
# Nr of averages
function set_nr_avg(scope::T;ch::String="1",navg::Int=1) where {T<:NIScope}
	error("not implemented yet")
end
# EnhanceRes
function set_eres(scope::T;ch::String="1",bits::String="0b") where {T<:NIScope}
	error("not available for instruments of type ::NIScope")
end
# Degauss
function degauss(scope::T;ch::String="1",probe::String="CP030A") where {T<:NIScope}
	error("not available for instruments of type ::NIScope")
end
# Vertical range
function set_vrange(scope::T;ch::String="1",vrang=8) where {T<:NIScope}
	NISCOPE_ATTR_VERTICAL_RANGE=1250001; # ((1000000 + 250000) + 1)
	ch = NIScope_Vertical_Dict[ch]
	status = niScope_SetAttributeViReal64(scope, ch, NISCOPE_ATTR_VERTICAL_RANGE, Float64(vrang))
end
# Vertical scale (V/div)
function set_vscale(scope::T;ch::String="1",volt=8) where {T<:NIScope}
	error("not implemented yet")
end
# Vertical offset
function set_voffs(scope::T;ch::String="1",voffs=0) where {T<:NIScope}
	NISCOPE_ATTR_VERTICAL_OFFSET=1250002; # ((1000000 + 250000) + 2)
	ch = NIScope_Vertical_Dict[ch]
	status = niScope_SetAttributeViReal64(scope, ch, NISCOPE_ATTR_VERTICAL_OFFSET, Float64(voffs))
end

