NIScope_Triggering_Dict = Dict()
# Set trigger type
NIScope_Triggering_Dict["edge"]      = NISCOPE_VAL_EDGE_TRIGGER
NIScope_Triggering_Dict["width"]     = NISCOPE_VAL_WIDTH_TRIGGER
NIScope_Triggering_Dict["runt"]      = NISCOPE_VAL_RUNT_TRIGGER
NIScope_Triggering_Dict["glitch"]    = NISCOPE_VAL_GLITCH_TRIGGER
NIScope_Triggering_Dict["tv"]        = NISCOPE_VAL_TV_TRIGGER
NIScope_Triggering_Dict["immediate"] = NISCOPE_VAL_IMMEDIATE_TRIGGER
NIScope_Triggering_Dict["acline"]    = 7
# Set trigger source, niScope channels start from 0, so subtract 1
NIScope_Triggering_Dict["1"]   = "0"
NIScope_Triggering_Dict["2"]   = "1"
NIScope_Triggering_Dict["3"]   = "2"
NIScope_Triggering_Dict["4"]   = "3"
NIScope_Triggering_Dict["5"]   = "4"
NIScope_Triggering_Dict["6"]   = "5"
NIScope_Triggering_Dict["7"]   = "6"
NIScope_Triggering_Dict["8"]   = "7"
NIScope_Triggering_Dict["ext"] = NISCOPE_VAL_EXTERNAL
NIScope_Triggering_Dict["ttl0"]= NISCOPE_VAL_TTL0
# Set trigger slope
NIScope_Triggering_Dict["pos"]    = NISCOPE_VAL_POSITIVE
NIScope_Triggering_Dict["neg"]    = IVISCOPE_VAL_NEGATIVE
NIScope_Triggering_Dict["either"] = NISCOPE_VAL_SLOPE_EITHER
# Trigger coupling
NIScope_Triggering_Dict["ac"]    = NISCOPE_VAL_AC 
NIScope_Triggering_Dict["dc"]    = NISCOPE_VAL_DC 
NIScope_Triggering_Dict["hfrej"] = NISCOPE_VAL_HF_REJECT 
NIScope_Triggering_Dict["lfrej"] = NISCOPE_VAL_LF_REJECT 
NIScope_Triggering_Dict["noiserej"] = 5#??
# Ext Trigger impedance
NIScope_Triggering_Dict["50"]    = NISCOPE_VAL_50_OHMS  
NIScope_Triggering_Dict["1M"]    = NISCOPE_VAL_1_MEG_OHM 

# Set trigger type
function set_trig_type(obj::T;tp::String="edge") where {T<:NIScope}
	#NISCOPE_ATTR_TRIGGER_TYPE=1250012; # ((1000000 + 250000) + 12)
	tp = NIScope_Triggering_Dict[tp]
	status = niScope_SetAttributeViInt32(obj, "", NISCOPE_ATTR_TRIGGER_TYPE, Int32(tp))
end
# Set trigger source
function set_trig_src(obj::T;src::String="1") where {T<:NIScope}
	#NISCOPE_ATTR_TRIGGER_SOURCE=1250013; # ((1000000 + 250000) + 13)
	src = NIScope_Triggering_Dict[src]
	status = niScope_SetAttributeViString(obj, "", NISCOPE_ATTR_TRIGGER_SOURCE, src)
end
# Set trigger mode
function set_trig_mode(obj::T;mode::String="normal") where {T<:NIScope}
	@warn "not available for instruments of type ::NIScope; default to SINGLE"
end
# Set trigger slope
function set_trig_slope(obj::T;slp::String="pos") where {T<:NIScope}
	#NISCOPE_ATTR_TRIGGER_SLOPE=1250018; # ((1000000 + 250000) + 18)
	slp = NIScope_Triggering_Dict[slp]
	status = niScope_SetAttributeViInt32(obj, "", NISCOPE_ATTR_TRIGGER_SLOPE, Int32(slp))
end
# Set trigger level
function set_trig_lev(obj::T;lev=1) where {T<:NIScope}
	#NISCOPE_ATTR_TRIGGER_LEVEL=1250017; # ((1000000 + 250000) + 17)
	status = niScope_SetAttributeViReal64(obj, "", NISCOPE_ATTR_TRIGGER_LEVEL, Float64(lev))
end
# Set trigger holdoff
function set_trig_holdoff(obj::T;hf=1e-9) where {T<:NIScope}
	#NISCOPE_ATTR_TRIGGER_HOLDOFF=1250016; # ((1000000 + 250000) + 16)
	status = niScope_SetAttributeViReal64(obj, "", NISCOPE_ATTR_TRIGGER_HOLDOFF, Float64(hf))
end
# Trigger delay time
function set_hoffs_t(obj::T;href=1e-3) where {T<:NIScope}
	#NISCOPE_ATTR_TRIGGER_DELAY_TIME=1250015; # ((1000000 + 250000) + 15)
	status = niScope_SetAttributeViReal64(obj, "", NISCOPE_ATTR_TRIGGER_DELAY_TIME, Float64(href))
end
# Set trigger coupling
function set_trig_cpl(obj::T;ch::String="1",cpl::String="dc") where {T<:NIScope}
	#NISCOPE_ATTR_TRIGGER_COUPLING=1250014; # ((1000000 + 250000) + 14)
	cpl = NIScope_Triggering_Dict[cpl]
	status = niScope_SetAttributeViInt32(obj, "", NISCOPE_ATTR_TRIGGER_COUPLING, Int32(cpl))
end
