LCR6xxx_Triggering_Dict = Dict()
# Set trigger type
LCR6xxx_Triggering_Dict["edge"]  = 0
LCR6xxx_Triggering_Dict["width"] = 1
# Set trigger source
LCR6xxx_Triggering_Dict["1"]  = 0
LCR6xxx_Triggering_Dict["2"]  = 1
LCR6xxx_Triggering_Dict["3"]  = 2
LCR6xxx_Triggering_Dict["4"]  = 3
LCR6xxx_Triggering_Dict["ext"]  = 4
# Set trigger mode
LCR6xxx_Triggering_Dict["auto"]   = 0
LCR6xxx_Triggering_Dict["normal"] = 1
LCR6xxx_Triggering_Dict["single"] = 2
LCR6xxx_Triggering_Dict["stop"] = 3
# Set trigger slope
LCR6xxx_Triggering_Dict["pos"]    = 0
LCR6xxx_Triggering_Dict["neg"]    = 1
LCR6xxx_Triggering_Dict["either"] = 2
# Trigger coupling
LCR6xxx_Triggering_Dict["dc"]    = 0
LCR6xxx_Triggering_Dict["ac"]    = 1
#LCR6xxx_Triggering_Dict["gnd"]   = 2
LCR6xxx_Triggering_Dict["lfrej"] = 2
LCR6xxx_Triggering_Dict["hfrej"] = 3

# Set trigger type
function set_trig_type(obj::T;tp::String="edge") where {T<:LCR6xxx}
	tp = LCR6xxx_Triggering_Dict[tp]
	write(obj,"VBS app.Acquisition.Trigger.Type=$tp")
end
# Set trigger source
function set_trig_src(obj::T;src::String="1") where {T<:LCR6xxx}
	src = LCR6xxx_Triggering_Dict[src]
	write(obj,"VBS app.Acquisition.Trigger.Edge.Source=$src")
end
# Set trigger mode
function set_trig_mode(obj::T;mode::String="normal") where {T<:LCR6xxx}
	mode = LCR6xxx_Triggering_Dict[mode]
	write(obj,"VBS app.Acquisition.TriggerMode=$mode")
end
# Set trigger slope
function set_trig_slope(obj::T;slp::String="pos") where {T<:LCR6xxx}
	slp = LCR6xxx_Triggering_Dict[slp]
	write(obj,"VBS app.Acquisition.Trigger.Edge.Slope=$slp")
end
# Set trigger level
function set_trig_lev(obj::T;lev=1) where {T<:LCR6xxx}
	write(obj,"VBS app.Acquisition.Trigger.Edge.Level=$lev")
end
# Set trigger holdoff
function set_trig_holdoff(obj::T;hf=1e-9) where {T<:LCR6xxx}
	write(obj,"VBS app.Acquisition.Trigger.Edge.HoldoffTime=$hf")
end
# Trigger delay time
function set_hoffs_t(obj::T;href=1e-3) where {T<:LCR6xxx}
	write(obj,"VBS app.Acquisition.Horizontal.HorOffset=$href")
end
# Set trigger coupling
function set_trig_cpl(obj::T;src::String="1",cpl::String="dc") where {T<:LCR6xxx}
	cpl = LCR6xxx_Triggering_Dict[cpl]
	write(obj,"VBS app.Acquisition.Trigger.C$(src)Coupling=$cpl")
end
