# Calling niScope from Julia
using Libdl
NI_libname = "niScope_64"
# niScope_64.dll location:
# doesn't work with full dll path string????
cd(raw"D:\Documents\Projects\Julia\PXI_control")
lib = Libdl.dlopen(NI_libname) # Open the library explicitly.
sym = Libdl.dlsym(lib, :niScope_init)
#ccall(sym, ...) # Use the pointer `sym` instead of the (symbol, library) tuple
#Libdl.dlclose(lib) # close dll

# ccall basic:
# ccall(:func, "dllname", return_type,(input types) ,input arguments)
# return type is not critical in this case: Int32 is sufficient for error code
# input and output types are critical for ccall

## Required Vi types:
ViStatus    = Int32
ViSession   = UInt32 # like resource manager rm (de-refferenced pointer)
ViPSession  = Ref{UInt32}
ViString    = Ptr{UInt8}
ViRsrc      = ViString
ViPFindList = Ref{UInt32}
ViPUInt32   = Ref{UInt32}
ViPByte     = Ref{UInt8}
ViBoolean   = Int16

############### niSCOPE
scope_obj_ptr = ViPSession(0)

scope1     = "PXI1Slot10"
scope1_Int = [UInt8.(collect(scope1)); UInt8(0)] # terminate with NULL char

status = ccall(sym, ViStatus,
        (ViString, ViBoolean, ViBoolean, ViPSession),
        scope1_Int, Int16(0), Int16(0), scope_obj_ptr)

scope_obj = scope_obj_ptr[]

# auto set
status = ccall((:niScope_AutoSetup, NI_libname), ViStatus, (ViSession,) ,scope_obj)
# close
status = ccall((:niScope_close, NI_libname), ViStatus, (ViSession,) ,scope_obj)


############### niDMM
dmm_obj_ptr = ViPSession(0)

dmm1     = "PXI1Slot5"

dmm1_Int = [UInt8.(collect(dmm1)); UInt8(0)] # terminate with NULL char

status = ccall((:niDmm_init, NI_libname), ViStatus,
        (ViString, ViBoolean, ViBoolean, ViPSession),
        scope1_Int, Int16(0), Int16(0), dmm_obj_ptr)
