NIDmm_lib_found = Libdl.find_library(libnidmm)
if ~isempty(NIDmm_lib_found)
#const lib = Libdl.dlopen(libnidmm) # Open the library explicitly. not working with dlsym in packages...
else
@warn "NI PXI libraries not found!\nPXI functionality broken\nPlease install NI drivers!"
end
#Libdl.dlclose(lib) # close dll
#sym = Libdl.dlsym(lib, :niScope_init)
#ccall(sym, ...) # Use the pointer `sym` instead of the (symbol, library) tuple
# ccall basic:
# ccall(:func, "dllname", return_type,(input types) ,input arguments)

include("wrapper/IviDmm_common.jl")
include("wrapper/IviDmm_api.jl")
include("wrapper/niDmm_common.jl")
include("wrapper/niDmm_api.jl")
