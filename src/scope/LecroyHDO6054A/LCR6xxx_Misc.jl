LCR6xxx_Misc_Dict = Dict()
# gridmode
LCR6xxx_Misc_Dict["single"] = 1
LCR6xxx_Misc_Dict["double"] = 2
LCR6xxx_Misc_Dict["quad"]   = 3

# Reset
reset_instr(obj::T) where {T<:LCR6xxx} = write(obj,"*RST")
# IDN
get_idn(obj::T) where {T<:LCR6xxx} = query(obj,"*IDN?")
# Default setup
default_setup(obj::T) where {T<:LCR6xxx} = write(obj,"VBS app.SetToDefaultSetup")
# Screen Gridmode
function set_gridmode(obj::T;gridmode::String="single") where {T<:LCR6xxx}
	gridmode = LCR6xxx_Misc_Dict[gridmode];
	write(obj,"VBS app.Display.GridMode=$gridmode")
end
# Clear sweeps
clear_sweeps(obj::T) where {T<:LCR6xxx} = write(obj,"VBS app.ClearSweeps")
