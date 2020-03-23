module SCOPE
using Instruments
using Libdl # for NI dlls
include("..\\constants.jl")
include("..\\INSTR_TYPES.jl")
include("..\\comm_utils.jl")
#
include("SCOPE_common.jl")
# specifics by manufacturer/model
include("LecroyHDO6054A.jl")
include("NIScope_low_level.jl")
include("NIScope_high_level_built_in.jl")
include("NIScope_low_level_user.jl")
include("NIScope.jl")
end #endmodule