NIScope_lib_found = Libdl.find_library(libniscope)
if ~isempty(NIScope_lib_found)
#const lib = Libdl.dlopen(libniscope) # Open the library explicitly. not working with dlsym in packages...
else
@warn "NI PXI libraries not found!\nPXI functionality broken\nPlease install NI drivers!"
end
#Libdl.dlclose(lib) # close dll
#sym = Libdl.dlsym(lib, :niScope_init)
#ccall(sym, ...) # Use the pointer `sym` instead of the (symbol, library) tuple
# ccall basic:
# ccall(:func, "dllname", return_type,(input types) ,input arguments)

include("wrapper/IviScope_common.jl")
include("wrapper/IviScope_api.jl")
include("wrapper/niScope_common.jl")
include("wrapper/niScope_api.jl")
include("wrapper/niScopeCal_api.jl")
include("wrapper/niScope_api_dispatcher.jl")

include("NIScope_Acquisition.jl")
include("NIScope_high_level_built_in.jl")
include("NIScope_Horizontal.jl")
include("NIScope_Math.jl")
include("NIScope_Measurements.jl")
include("NIScope_Misc.jl")
include("NIScope_Synchronization.jl")
include("NIScope_Triggering.jl")
include("NIScope_Vertical.jl")