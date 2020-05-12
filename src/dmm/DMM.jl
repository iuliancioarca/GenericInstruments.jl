module DMM
using Libdl # for NI dlls
include("../INSTR_TYPES.jl")
include("../lib_locations.jl")
include("../visa/VISA.jl")
#
## include all DMM files
include("./Keithley2000/KE2000.jl")
# NI
include("NIDmm/NIDmm.jl")
include("NIDmm/NIDmm_Misc.jl")
end #endmodule
