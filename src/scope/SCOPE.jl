module SCOPE
using Libdl # for NI dlls
include("../INSTR_TYPES.jl")
include("../lib_locations.jl")
include("../visa/VISA.jl")
#
include("SCOPE_common.jl")
# Lecroy
# specifics by manufacturer/model
include("./LecroyHDO6054A/LCR6xxx_Acquisition.jl")
include("./LecroyHDO6054A/LCR6xxx_Horizontal.jl")
include("./LecroyHDO6054A/LCR6xxx_Math.jl")
include("./LecroyHDO6054A/LCR6xxx_Measurements.jl")
include("./LecroyHDO6054A/LCR6xxx_Misc.jl")
include("./LecroyHDO6054A/LCR6xxx_Synchronization.jl")
include("./LecroyHDO6054A/LCR6xxx_Triggering.jl")
include("./LecroyHDO6054A/LCR6xxx_Vertical.jl")

# PXI
include("NIScope/NIScope.jl")

end #endmodule
