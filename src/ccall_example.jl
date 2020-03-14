## get hostname
hn = Vector{UInt8}(undef, 256)
err = ccall(:gethostname, stdcall, Int32, (Ptr{UInt8}, UInt32), hn, length(hn))
hn_string = unsafe_string(pointer(hn))
#or ???
hn_string = Char.(hn)
String(hn_string[1:16]) #where to stop?

## let's call niVISA
cd(raw"C:\\Windows\\SYSTEM32")
# Required Vi types:
ViStatus = Int32
ViSession = UInt32 # like resource manager rm (derefferenced pointer)
ViPSession = Ref{UInt32}
ViString = Ptr{UInt8}
ViPFindList = Ref{UInt32}
ViPUInt32 = Ref{UInt32}
ViPByte = Ref{UInt8}

# using Libdl
# libvisa = "C:\\Windows\\SYSTEM32\\visa64"
# lib = Libdl.dlopen(libvisa) # Open the library explicitly.
# sym = Libdl.dlsym(lib, :viOpenDefaultRM)
# new resource manager
res_m = ViPSession(0)
# doesn't work with full dll path string????
# ccall((:viOpenDefaultRM, libvisa), ViStatus, (ViPSession,), res_m)
# or
ccall((:viOpenDefaultRM, "visa64"), ViStatus, (ViPSession,), res_m)
res = res_m.x

# find resources
function viFindRsrc_user(sesn::ViSession, expr::AbstractString)
	returnCount = ViPUInt32(0)
	findList = ViPFindList(0)
	VI_FIND_BUFLEN = 256
	ViByte = UInt8
	desc = zeros(ViByte, VI_FIND_BUFLEN)
	descp = pointer(desc)
	ccall((:viFindRsrc,  "visa64"), ViStatus,
						(ViSession, ViString, ViPFindList, ViPUInt32, ViPByte),
						sesn, expr, findList, returnCount, descp)
	return returnCount, findList, desc, descp
end

returnCount, findList, desc, descp = viFindRsrc_user(res, "ASRL3::INSTR")
findList[]
unsafe_string(descp)

# equivalent to
using Instruments
res_m = ResourceManager()
find_resources(res_m)
