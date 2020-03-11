module GenericInstruments
using Instruments
include("PSU.jl")
include("FGEN.jl")
include("SCOPE.jl")
include("DMM.jl")
using .PSU
using .FGEN
using .SCOPE
using .DMM

end #endmodule