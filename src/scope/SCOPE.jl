module SCOPE
include("..\\INSTR_TYPES.jl")
#
include("SCOPE_common.jl")
# specifics by manufacturer/model
include("LecroyHDO6054A.jl")
include("NIScope.jl")
end #endmodule