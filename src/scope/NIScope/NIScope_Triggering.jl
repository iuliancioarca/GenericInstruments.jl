NIScope_Triggering_Dict = Dict()
# Set trigger type
NIScope_Triggering_Dict["edge"]  = 0
NIScope_Triggering_Dict["width"] = 1
# Set trigger source, niScope channels start from 0, so subtract 1
NIScope_Triggering_Dict["1"]   = "0"
NIScope_Triggering_Dict["2"]   = "1"
NIScope_Triggering_Dict["3"]   = "2"
NIScope_Triggering_Dict["4"]   = "3"
NIScope_Triggering_Dict["ext"] = "ext"
# Set trigger slope
NIScope_Triggering_Dict["pos"]    = 0
NIScope_Triggering_Dict["neg"]    = 1
NIScope_Triggering_Dict["either"] = 2
# Trigger coupling
NIScope_Triggering_Dict["ac"]    = 0
NIScope_Triggering_Dict["dc"]    = 1
NIScope_Triggering_Dict["gnd"]   = 2
NIScope_Triggering_Dict["lfrej"] = 3
NIScope_Triggering_Dict["hfrej"] = 4

# Set trigger type
function set_trig_type(scope::T;tp::String="edge") where {T<:NIScope}
	NISCOPE_ATTR_TRIGGER_TYPE=1250012; # ((1000000 + 250000) + 12)
	tp = NIScope_Triggering_Dict[tp]
	status = niScope_SetAttributeViInt32(scope, "", NISCOPE_ATTR_TRIGGER_TYPE, Int32(tp))
end
# Set trigger source
function set_trig_src(scope::T;src::String="1") where {T<:NIScope}
	NISCOPE_ATTR_TRIGGER_SOURCE=1250013; # ((1000000 + 250000) + 13)
	src = NIScope_Triggering_Dict[src]
	status = niScope_SetAttributeViString(scope::T, "", NISCOPE_ATTR_TRIGGER_SOURCE, src)
end
# Set trigger mode
function set_trig_mode(scope::T;mode::String="normal") where {T<:NIScope}
	@warn "not available for instruments of type ::NIScope; default to SINGLE"
end
# Set trigger slope
function set_trig_slope(scope::T;slp::String="pos") where {T<:NIScope}
	NISCOPE_ATTR_TRIGGER_SLOPE=1250018; # ((1000000 + 250000) + 18)
	slp = NIScope_Triggering_Dict[slp]
	status = niScope_SetAttributeViString(scope::T, "", NISCOPE_ATTR_TRIGGER_SLOPE, Int32(slp))
end
# Set trigger level
function set_trig_lev(scope::T;lev=1) where {T<:NIScope}
	NISCOPE_ATTR_TRIGGER_LEVEL=1250017; # ((1000000 + 250000) + 17)
	status = niScope_SetAttributeViReal64(scope, "", NISCOPE_ATTR_TRIGGER_LEVEL, Float64(lev))
end
# Set trigger holdoff
function set_trig_holdoff(scope::T;hf=1e-9) where {T<:NIScope}
	NISCOPE_ATTR_TRIGGER_HOLDOFF=1250016; # ((1000000 + 250000) + 16)
	status = niScope_SetAttributeViReal64(scope, "", NISCOPE_ATTR_TRIGGER_HOLDOFF, Float64(hf))
end
# Trigger delay time
function set_hoffs_t(scope::T;href=1e-3) where {T<:NIScope}
	NISCOPE_ATTR_TRIGGER_DELAY_TIME=1250015; # ((1000000 + 250000) + 15)
	status = niScope_SetAttributeViReal64(scope, "", NISCOPE_ATTR_TRIGGER_DELAY_TIME, Float64(href))
end
# Set trigger coupling
function set_trig_cpl(scope::T;ch::String="1",cpl::String="dc") where {T<:NIScope}
	NISCOPE_ATTR_TRIGGER_COUPLING=1250014; # ((1000000 + 250000) + 14)
	ch  = NIScope_Triggering_Dict[ch]
	cpl = NIScope_Triggering_Dict[cpl]
	status = niScope_SetAttributeViInt32(scope, ch, NISCOPE_ATTR_TRIGGER_COUPLING, Int32(cpl))
end
