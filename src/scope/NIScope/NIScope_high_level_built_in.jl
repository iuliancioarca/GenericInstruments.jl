
## NISCOPE built-in high level functions
# Configure vertical
"""
niScope_ConfigureVertical(scope::T;ch=0,vrang=5.0,voffs=0.5,cpl=Int32(0),att=10.0,st=Int16(1)) where {T<:NISCOPE}
"""
function niScope_ConfigureVertical(scope::T;ch=0,vrang=5.0,voffs=0.5,
	cpl=Int32(0),att=10.0,st=Int16(1)) where {T<:NISCOPE}
# niScope_ConfigureVertical (ViSession vi, ViConstString chlist, ViReal64 range, ViReal64 offset, ViInt32 cpl, ViReal64 att, ViBoolean st);
	sym = Libdl.dlsym(lib, :niScope_ConfigureVertical )
	chlist = [UInt8.(collect("0")); UInt8(0)] # terminate with NULL char
	status = ccall(sym, ViStatus, (ViSession,ViConstString, ViReal64, ViReal64, ViInt32, ViReal64, ViBoolean),
			scope.obj, chlist, vrang, voffs, cpl, att, st)
end

# Configure horizontal
"""
status = niScope_ConfigureHorizontalTiming(scope::T;minSampleRate=2e5,minNumPts=1000,refPosition=0.1,numRecords=1,enforceRealtime=Int16(1)) where {T<:NISCOPE}
"""
function niScope_ConfigureHorizontalTiming(scope::T;minSampleRate=2e5,
	minNumPts=1000,refPosition=0.1,numRecords=1,enforceRealtime=Int16(1)) where {T<:NISCOPE}
# niScope_ConfigureHorizontalTiming
	sym = Libdl.dlsym(lib, :niScope_ConfigureHorizontalTiming )
	status = ccall(sym, ViStatus, (ViSession, ViReal64, ViInt32, ViReal64, ViInt32, ViBoolean),
			scope.obj, minSampleRate, minNumPts, refPosition, numRecords, enforceRealtime)
end

