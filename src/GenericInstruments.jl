module GenericInstruments

# lib locations
include("lib_locations.jl")
# common instrument containers
include("INSTR_TYPES.jl")
# visa wrapper,constants and utils
include("visa/VISA.jl")
# instruments
include("psu/PSU.jl")
include("awg/AWG.jl")
include("scope/SCOPE.jl")
include("dmm/DMM.jl")

using .PSU
using .AWG
using .SCOPE
using .DMM

end #endmodule
