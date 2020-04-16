module SCOPE
using Instruments
using Libdl # for NI dlls
include("../constants.jl")
include("../INSTR_TYPES.jl")
include("../comm_utils.jl")
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
include("./NIScope/NIScope.jl")
include("./NIScope/NIScope_Acquisition.jl")
include("./NIScope/NIScope_high_level_built_in.jl")
include("./NIScope/NIScope_Horizontal.jl")
include("./NIScope/NIScope_low_level.jl")
include("./NIScope/NIScope_Math.jl")
include("./NIScope/NIScope_Measurements.jl")
include("./NIScope/NIScope_Misc.jl")
include("./NIScope/NIScope_Synchronization.jl")
include("./NIScope/NIScope_Triggering.jl")
include("./NIScope/NIScope_Vertical.jl")
end #endmodule
