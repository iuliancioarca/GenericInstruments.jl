LCR6xxx_Measurements_Dict = Dict()
# Set Measurement
LCR6xxx_Measurements_Dict["max"] = 0
LCR6xxx_Measurements_Dict["min"] = 1
LCR6xxx_Measurements_Dict["amplitude"] = 2

# Set Measurement
function set_meas(scope::T;ch::String="1",fct::String="max",par::Int=1,vw::Int=1) where {T<:LCR6xxx}
	fct = LCR6xxx_Measurements_Dict[fct]
	write(scope.obj,"VBS app.Measure.P$par.ParamEngine=$fct")
	write(scope.obj,"VBS app.Measure.P$par.Source1=$ch")
	write(scope.obj,"VBS app.Measure.P$par.View=$vw")
end
# Get Measurement
function get_meas(scope::T;par::Int=1) where {T<:LCR6xxx}
	query(scope.obj,"VBS? Return=app.Measure.P$par.Out.Result.Value")
end
