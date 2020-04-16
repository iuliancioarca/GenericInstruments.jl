NIScope_Misc_Dict = Dict()

# Reset
#reset_instr(scope::T) where {T<:NIScope}
# IDN
#get_idn(scope::T) where {T<:NIScope}
# Default setup
#default_setup(scope::T) where {T<:NIScope}
# Clear sweeps - not available for NIScope
#clear_sweeps(scope::T) where {T<:NIScope}



"""
scope = niScope_init(scope::T) where {T<:NIScope}
scope is a mutable struct of type:
mutable struct INSTR{instr_name}
    name::Symbol
    address::String
    obj
end
"""
function niScope_init(scope::T) where {T<:NIScope}
	scope_obj_ptr = ViPSession(0)
	scope1_Int = [UInt8.(collect(scope.address)); UInt8(0)] # terminate with NULL char
	status = ccall((:niScope_init, NIScope_lib), ViStatus,
			(ViString, ViBoolean, ViBoolean, ViPSession),
			scope1_Int, Int16(0), Int16(0), scope_obj_ptr)
	scope.obj = scope_obj_ptr[]
	return scope
end

# close
"""
status = niScope_close(scope::T) where {T<:NIScope}
"""
function niScope_close(scope::T) where {T<:NIScope}
	status = ccall((:niScope_close, NIScope_lib), ViStatus, (ViSession,) ,scope.obj)
	return status
end



# Auto set
"""
status = niScope_AutoSetup(scope::T) where {T<:NIScope}
"""
function niScope_AutoSetup(scope::T) where {T<:NIScope}
	status = ccall((:niScope_AutoSetup, NIScope_lib), ViStatus, (ViSession,) ,scope.obj)
end


# Trigger immediate
"""
status = niScope_ConfigureTriggerImmediate(scope::T) where {T<:NIScope}
"""
function niScope_ConfigureTriggerImmediate(scope::T) where {T<:NIScope}
	status = ccall((:niScope_ConfigureTriggerImmediate, NIScope_lib), ViStatus, (ViSession,) ,scope.obj)
end

# Init acquisition
"""
status = niScope_InitiateAcquisition(scope::T) where {T<:NIScope}
"""
function niScope_InitiateAcquisition(scope::T) where {T<:NIScope}
	status = ccall((:niScope_InitiateAcquisition, NIScope_lib), ViStatus, (ViSession,) ,scope.obj)
end

# niScope_ActualRecordLength
"""
record_length = niScope_ActualRecordLength(scope::T) where {T<:NIScope}
"""
function niScope_ActualRecordLength(scope::T) where {T<:NIScope}
#ViStatus niScope_ActualRecordLength (ViSession vi, ViInt32* recordLength);
	res    = Int32(0)
	pres   = ViPInt32(res)
	status = ccall((:niScope_ActualRecordLength, NIScope_lib), ViStatus, (ViSession,ViPInt32) ,scope.obj,pres)
	return pres[]
end


