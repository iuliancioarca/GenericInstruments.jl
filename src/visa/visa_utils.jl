# from: https://github.com/BBN-Q/Instruments.jl

# Helper functions to find instruments
# resmgr = viOpenDefaultRM()
# viFindRsrc(resmgr, expr)

function check_status(status)
	if status < VI_SUCCESS
		errMsg = codes[status]
		error("VISA C call failed with status $(errMsg[1]): $(errMsg[2])")
	end
	status
end

#- Resource Manager Functions and Operations -------------------------------#
function viOpenDefaultRM()
	rm = ViPSession(0)
	check_status(ccall((:viOpenDefaultRM, libvisa), ViStatus, (ViPSession,), rm))
	rm.x
end

function viFindRsrc(sesn::ViSession, expr::AbstractString)
	returnCount = ViPUInt32(0)
	findList = ViPFindList(0)
	desc = zeros(ViByte, VI_FIND_BUFLEN)
	descp = pointer(desc)
	check_status(ccall((:viFindRsrc, libvisa), ViStatus,
						(ViSession, ViString, ViPFindList, ViPUInt32, ViPByte),
						sesn, expr, findList, returnCount, descp))

	#Create the array of instrument strings and push them on
	instrStrs = Vector{String}()
	if returnCount.x > 0
		push!(instrStrs, unsafe_string(descp))
	end
	for i=1:returnCount.x-1
		check_status(ccall((:viFindNext, libvisa), ViStatus,
						(ViFindList, ViPByte), findList.x, descp))
		push!(instrStrs, unsafe_string(descp))
		
	end

	instrStrs
end


function viClose(viObj::ViObject)
	check_status(ccall((:viClose, libvisa), ViStatus, (ViObject,), viObj))
end



# #- Resource Template Operations --------------------------------------------*/

function viSetAttribute(viObj::ViObject, attrName::ViAttr, attrValue::ViAttrState)
	check_status(ccall((:viSetAttribute, libvisa), ViStatus,
						(ViObject, ViAttr, ViAttrState),
						viObj, attrName, attrValue))
end

function viGetAttribute(viObj::ViObject, attrName::ViAttr)
	value = ViAttrState[0]
	check_status( ccall((:viGetAttribute, libvisa), ViStatus,
						(ViObject, ViAttr, Ptr{Cvoid}),
						viObj, attrName, value))
	value[]
end


function viEnableEvent(instrHandle::ViSession, eventType::Integer,
					   mechanism::Integer)
	check_status(ccall((:viEnableEvent,libvisa), ViStatus,
						(ViSession, ViEventType, UInt16, ViEventFilter),
						 instrHandle, eventType, mechanism, 0))
end

function viDisableEvent(instrHandle::ViSession, eventType::Integer,
					   mechanism::Integer)
	check_status(ccall((:viEnableEvent,libvisa), ViStatus,
						(ViSession, ViEventType, UInt16),
						 instrHandle, eventType, mechanism))
end

function viDiscardEvents(instrHandle::ViSession, eventType::ViEventType,
					   mechanism::UInt16)
	check_status(ccall((:viEnableEvent,libvisa), ViStatus,
						(ViSession, ViEventType, UInt16),
						 instrHandle, eventType, mechanism))
end

function viWaitOnEvent(instrHandle::ViSession, eventType::ViEventType, timeout::UInt32 = VI_TMO_INFINITE)
	outType = Array(ViEventType)
	outEvent = Array(ViEvent)
	check_status(ccall((:viWaitOnEvent,libvisa), ViStatus,
						(ViSession, ViEventType, UInt32, Ptr{ViEventType}, Ptr{ViEvent}),
						 instrHandle, eventType, timeout, outType, outEvent))
	(outType[], outEvent[])
end


#- Basic I/O Operations ----------------------------------------------------#

function viWrite(instrHandle::ViSession, data::Union{String, Vector{UInt8}})
	bytesWritten = ViUInt32[0]
	check_status(ccall((:viWrite, libvisa), ViStatus,
						(ViSession, ViBuf, ViUInt32, ViPUInt32),
						instrHandle, pointer(data), length(data), bytesWritten))
	bytesWritten[1]
end

function viRead!(instrHandle::ViSession, buffer::Array{UInt8})
	bytesRead = ViUInt32[0]
	status = check_status(ccall((:viRead, libvisa), ViStatus,
						(ViSession, ViBuf, ViUInt32, ViPUInt32),
						instrHandle, buffer, sizeof(buffer), bytesRead))
	return (status != VI_SUCCESS_MAX_CNT, bytesRead[])
end

function viRead(instrHandle::ViSession; bufSize::UInt32=0x00000400)
	buf = zeros(UInt8, bufSize)
	(done, bytesRead) = viRead!(instrHandle, buf)
	unsafe_string(pointer(buf))
end

function readavailable(instrHandle::ViSession)
	ret = IOBuffer()
	buf = Array(UInt8, 0x400)
	while true
		(done, bytesRead) = viRead!(instrHandle, buf)
		write(ret,buf[1:bytesRead])
		if done
			break
		end
	end
	take!(ret)
end

write(obj::T, msg::AbstractString) where {T<:Instrument} = viWrite(obj.handle, msg) 

read(obj::T) where {T<:Instrument} = rstrip(viRead(obj.handle; bufSize=obj.bufSize), ['\r', '\n']) 

readavailable(obj::T) where {T<:Instrument} = readavailable(obj.handle) 

# connect,disconnect, query
function connect!(sesn, obj, mode=VI_NO_LOCK, timeout=VI_TMO_IMMEDIATE)
	if !obj.initialized
		#Pointer for the instrument handle
		vi = ViPSession(0)
		check_status(viOpen(sesn, obj.address, mode, timeout, vi))
		obj.handle = vi.x
		obj.initialized = true
	end
end

function disconnect!(obj::T) where {T<:Instrument}
	if obj.initialized
		viClose(obj.handle)
		obj.initialized = false
	end
end

function query(obj::T, msg::AbstractString; delay::Real=0) where {T<:Instrument}
	write(obj, msg)
	sleep(delay)
	read(obj)
end


