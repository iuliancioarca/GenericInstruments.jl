NIScope_Misc_Dict = Dict()

# Reset
#reset_instr(obj::T) where {T<:NIScope}
# IDN
#get_idn(obj::T) where {T<:NIScope}
# Default setup
#default_setup(obj::T) where {T<:NIScope}
# Clear sweeps - not available for NIScope
#clear_sweeps(obj::T) where {T<:NIScope}



"""
scope = connect!(obj::T) where {T<:NIScope}
"""
function connect!(obj::T) where {T<:NIScope}
	obj_ptr = ViPSession(0)
	obj_Int = [UInt8.(collect(obj.address)); UInt8(0)] # terminate with NULL char
	status = niScope_init(obj_Int, Int16(0), Int16(0), obj_ptr)					
	obj.handle = obj_ptr[]
	obj.initialized = true
	return obj
end

# close
"""
status = disconnect!(obj::T) where {T<:NIScope}
"""
function disconnect!(obj::T) where {T<:NIScope}
	status = niScope_close(obj.handle)
	obj.initialized = false
	return status
end

# IDN
function get_idn(obj::T) where {T<:NIScope}
	chlist = [UInt8.(collect("")); UInt8(0)] # terminate with NULL char
	bufSize = Int32(256)
	res    = zeros(UInt8,bufSize)
	pres   = Ref(res)	
	status = niScope_GetAttributeViString(obj.handle, 
		chlist, NISCOPE_ATTR_INSTRUMENT_MODEL, bufSize, res)
	return (status, unsafe_string(pointer(res)))
end


# Auto set
"""
status = niScope_AutoSetup(obj::T) where {T<:NIScope}
"""
function niScope_AutoSetup(obj::T) where {T<:NIScope}
	status = niScope_AutoSetup(obj.handle)
	return (status, niScope_GetError(obj))
end


# Trigger immediate
"""
status = niScope_ConfigureTriggerImmediate(obj::T) where {T<:NIScope}
"""
function niScope_ConfigureTriggerImmediate(obj::T) where {T<:NIScope}
	status = niScope_ConfigureTriggerImmediate(obj.handle)
	return (status, niScope_GetError(obj))
end

# Init acquisition
"""
status = niScope_InitiateAcquisition(obj::T) where {T<:NIScope}
"""
function niScope_InitiateAcquisition(obj::T) where {T<:NIScope}
	status = niScope_InitiateAcquisition(obj.handle)
	return (status, niScope_GetError(obj))
end

# niScope_ActualRecordLength
"""
record_length = niScope_ActualRecordLength(obj::T) where {T<:NIScope}
"""
function niScope_ActualRecordLength(obj::T) where {T<:NIScope}
#ViStatus niScope_ActualRecordLength (ViSession vi, ViInt32* recordLength);
	res    = Int32(0)
	pres   = ViPInt32(res)
	status = niScope_ActualRecordLength(obj.handle,pres)
	return pres[]
end


