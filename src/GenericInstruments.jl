module GenericInstruments
using Instruments
include("PSU.jl")
include("AWG.jl")
include("SCOPE.jl")
include("DMM.jl")
using .PSU
using .AWG
using .SCOPE
using .DMM

end #endmodule