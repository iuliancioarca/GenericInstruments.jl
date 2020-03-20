module AWG
include("..\\INSTR_TYPES.jl")
#
## include all AWG files
include("AWG_common.jl")
# specifics by manufacturer/model
include("Agilent33500B.jl")
include("Agilent33250A.jl")
end #endmodule