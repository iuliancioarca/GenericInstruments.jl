module AWG
using Libdl # for NI dlls
include("../INSTR_TYPES.jl")
include("../lib_locations.jl")
include("../visa/VISA.jl")
#
## include all AWG files
include("./Agilent/AWG_Agilent_common.jl")
include("./Agilent/Agilent33500B.jl")
include("./Agilent/Agilent33250A.jl")
# NI
include("NIFgen/NIFgen.jl")
include("NIFgen/NIFgen_Misc.jl")
end #endmodule
