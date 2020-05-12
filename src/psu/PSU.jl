module PSU
using Libdl # for NI dlls
include("../INSTR_TYPES.jl")
include("../lib_locations.jl")
include("../visa/VISA.jl")
## include all PSU files
include("./AgilentE36xx/AgilentE364x.jl")

end #endmodule
