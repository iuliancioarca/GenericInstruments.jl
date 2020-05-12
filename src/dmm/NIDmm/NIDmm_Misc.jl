NIDmm_Misc_Dict = Dict()

"""
dmm = connect!(obj::T) where {T<:NIDmm}
"""
function connect!(obj::T) where {T<:NIDmm}
	obj_ptr = ViPSession(0)
	obj_Int = [UInt8.(collect(obj.address)); UInt8(0)] # terminate with NULL char
	status = niDMM_init(obj_Int, Int16(0), Int16(0), obj_ptr)					
	obj.handle = obj_ptr[]
	obj.initialized = true
	return obj
end

# close
"""
status = disconnect!(obj::T) where {T<:NIDmm}
"""
function disconnect!(obj::T) where {T<:NIDmm}
	status = niDMM_close(obj.handle)
	obj.initialized = false
	return status
end

# IDN
function get_idn(obj::T) where {T<:NIDmm}
	chlist = [UInt8.(collect("")); UInt8(0)] # terminate with NULL char
	bufSize = Int32(256)
	res    = zeros(UInt8,bufSize)
	pres   = Ref(res)	
	status = niDMM_GetAttributeViString(obj.handle, 
		chlist, NIDMM_ATTR_INSTRUMENT_MODEL, bufSize, res)
	return (status, unsafe_string(pointer(res)))
end
