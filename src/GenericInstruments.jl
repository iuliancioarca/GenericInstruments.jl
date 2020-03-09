module GenericInstruments
using Instruments
include("PSU.jl")
include("FGEN.jl")
include("SCOPE.jl")
using .PSU
using .FGEN
using .SCOPE

end #endmodule