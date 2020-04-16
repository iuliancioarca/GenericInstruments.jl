NI_lib_found = Libdl.find_library(NI_libname)
if ~isempty(NI_lib_found)
lib = Libdl.dlopen(NI_libname) # Open the library explicitly.
else
@warn "NI PXI libraries not found!\nPXI functionality broken\nPlease install NI drivers!"
end
#Libdl.dlclose(lib) # close dll
#sym = Libdl.dlsym(lib, :niScope_init)
#ccall(sym, ...) # Use the pointer `sym` instead of the (symbol, library) tuple
# ccall basic:
# ccall(:func, "dllname", return_type,(input types) ,input arguments)
