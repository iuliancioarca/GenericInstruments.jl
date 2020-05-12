NIFgen_lib_found = Libdl.find_library(libnifgen)
if ~isempty(NIFgen_lib_found)
#const lib = Libdl.dlopen(libnifgen) # Open the library explicitly. not working with dlsym in packages...
else
@warn "NI PXI libraries not found!\nPXI functionality broken\nPlease install NI drivers!"
end
#Libdl.dlclose(lib) # close dll
#sym = Libdl.dlsym(lib, :niScope_init)
#ccall(sym, ...) # Use the pointer `sym` instead of the (symbol, library) tuple
# ccall basic:
# ccall(:func, "dllname", return_type,(input types) ,input arguments)

include("wrapper/IviFgen_common.jl")
include("wrapper/IviFgen_api.jl")
include("wrapper/niFgen_common.jl")
include("wrapper/niFgen_api.jl")
