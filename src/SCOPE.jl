module SCOPE
include("comm_utils.jl")
include("INSTR_TYPES.jl")
include("scope_common.jl")
# specifics by manufacturer/model
include("LecroyHDO6054A.jl")
include("niScope.jl")
end #endmodule