LCR6xxx_Misc_Dict = Dict()
# gridmode
LCR6xxx_Dict["single"] = 0
LCR6xxx_Dict["double"] = 1
LCR6xxx_Dict["quad"]   = 2

# Reset
reset_instr(scope::T) where {T<:LCR6xxx} = write(scope.obj,"*RST")
# IDN
get_idn(scope::T) where {T<:LCR6xxx} = query(scope.obj,"*IDN?")
# Default setup
default_setup(scope::T) where {T<:LCR6xxx} = write(scope.obj,"VBS app.SetToDefaultSetup")
# Screen Gridmode
function set_gridmode(scope::T;gridmode::String="single") where {T<:LCR6xxx}
	gridmode = LCR6xxx_Misc_Dict[gridmode];
	write(scope.obj,"VBS app.Display.GridMode=$gridmode")
end
# Clear sweeps
clear_sweeps(scope::T) where {T<:LCR6xxx} = write(scope.obj,"VBS app.ClearSweeps")
