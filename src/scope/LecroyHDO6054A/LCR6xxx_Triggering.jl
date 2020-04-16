LCR6xxx_Triggering_Dict = Dict()
# Set trigger type
LCR6xxx_Triggering_Dict["edge"]  = 0
LCR6xxx_Triggering_Dict["width"] = 1
# Set trigger source
#not needed, either channel or ext
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
LCR6xxx_Triggering_Dict["ac"]    = 0
LCR6xxx_Triggering_Dict["dc"]    = 1
LCR6xxx_Triggering_Dict["gnd"]   = 2
LCR6xxx_Triggering_Dict["lfrej"] = 3
LCR6xxx_Triggering_Dict["hfrej"] = 4

# Set trigger type
function set_trig_type(scope::T;tp::String="edge") where {T<:LCR6xxx}
	tp = LCR6xxx_Triggering_Dict[tp]
	write(scope.obj,"VBS app.Acquisition.Trigger.Type=$tp")
end
# Set trigger source
function set_trig_src(scope::T;src::String="1") where {T<:LCR6xxx}
	write(scope.obj,"VBS app.Acquisition.Trigger.Edge.Source=$src")
end
# Set trigger mode
function set_trig_mode(scope::T;mode::String="normal") where {T<:LCR6xxx}
	mode = LCR6xxx_Triggering_Dict[mode]
	write(scope.obj,"VBS app.Acquisition.TriggerMode=$mode")
end
# Set trigger slope
function set_trig_slope(scope::T;slp::String="pos") where {T<:LCR6xxx}
	slp = LCR6xxx_Triggering_Dict[slp]
	write(scope.obj,"VBS app.Acquisition.Trigger.Edge.Slope=$slp")
end
# Set trigger level
function set_trig_lev(scope::T;lev=1) where {T<:LCR6xxx}
	write(scope.obj,"VBS app.Acquisition.Trigger.Edge.Level=$lev")
end
# Set trigger holdoff
function set_trig_holdoff(scope::T;hf=1e-9) where {T<:LCR6xxx}
	write(scope.obj,"VBS app.Acquisition.Trigger.Edge.HoldoffTime=$hf")
end
# Trigger delay time
function set_hoffs_t(scope::T;href=1e-3) where {T<:LCR6xxx}
	write(scope.obj,"VBS app.Acquisition.Horizontal.HorOffset=$href")
end
# Set trigger coupling
function set_trig_cpl(scope::T;src::String="1",cpl::String="dc") where {T<:LCR6xxx}
	cpl = LCR6xxx_Triggering_Dict[cpl]
	write(scope.obj,"VBS app.Acquisition.Trigger.C$(src)Coupling=$cpl")
end
