
## NIScope built-in high level functions
# Configure vertical
"""
niScope_ConfigureVertical(obj::T;ch::String="1",vrang=5.0,voffs=0.5,cpl="dc",att="10x",st="on") where {T<:NIScope}
"""
function niScope_ConfigureVertical(obj::T;ch::String="1",vrang=5.0,voffs=0.5,
	cpl="dc",att="10x",st="on") where {T<:NIScope}
	chlist = [UInt8.(collect("0")); UInt8(0)] # terminate with NULL char	
	cpl = NIScope_Vertical_Dict[cpl]
	att = NIScope_Vertical_Dict[att]
	st = NIScope_Vertical_Dict[st]
	status = niScope_ConfigureVertical(obj.handle, chlist, vrang, voffs, cpl, att, st)
end

# Configure horizontal
"""
status = niScope_ConfigureHorizontalTiming(obj::T;minSampleRate=2e5,minNumPts=1000,refPosition=0.1,numRecords=1,enforceRealtime=Int16(1)) where {T<:NISCOPE}
"""
function niScope_ConfigureHorizontalTiming(obj::T;minSampleRate=2e5,
	minNumPts=1000,refPosition=0.1,numRecords=1,enforceRealtime=Int16(1)) where {T<:NIScope}
	status = niScope_ConfigureHorizontalTiming(obj.handle, minSampleRate, minNumPts, refPosition, numRecords, enforceRealtime)
end

