module GenericInstruments
using Instruments
import Instruments: ResourceManager, GenericInstrument, connect!, disconnect!, write, read, query

# common instr containers, connect/disconnect methods
include("comm_utils.jl")
include("INSTR_TYPES.jl")
# instruments
include("psu\\PSU.jl")
include("awg\\AWG.jl")
include("scope\\SCOPE.jl")
include("dmm\\DMM.jl")

using .PSU
using .AWG
using .SCOPE
using .DMM

end #endmodule
