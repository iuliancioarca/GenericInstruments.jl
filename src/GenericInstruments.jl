module GenericInstruments
using Instruments
include("PSU.jl")
include("FGEN.jl")
using .PSU
using .FGEN

end #endmodule