# Julia wrapper for header: ivi.h
# Automatically generated using Clang.jl


function Ivi_SpecificDriverNew(specificPrefix, optionsString, vi)
    ccall((:Ivi_SpecificDriverNew, libniscope), ViStatus, (ViConstString, ViConstString, Ptr{ViSession}), specificPrefix, optionsString, vi)
end

function Ivi_ApplyDefaultSetup(vi)
    ccall((:Ivi_ApplyDefaultSetup, libniscope), ViStatus, (ViSession,), vi)
end

function Ivi_GetSpecificDriverStatusDesc(vi, statusCode, messageBuf, additionalTableToSearch)
    ccall((:Ivi_GetSpecificDriverStatusDesc, libniscope), ViStatus, (ViSession, ViStatus, Ptr{ViChar}, IviStringValueTable), vi, statusCode, messageBuf, additionalTableToSearch)
end

function Ivi_NeedToCheckStatus(vi)
    ccall((:Ivi_NeedToCheckStatus, libniscope), ViBoolean, (ViSession,), vi)
end

function Ivi_SetNeedToCheckStatus(vi, needToCheckStatus)
    ccall((:Ivi_SetNeedToCheckStatus, libniscope), ViStatus, (ViSession, ViBoolean), vi, needToCheckStatus)
end

function Ivi_QueueInstrSpecificError(vi, instrumentError, message)
    ccall((:Ivi_QueueInstrSpecificError, libniscope), ViStatus, (ViSession, ViInt32, ViConstString), vi, instrumentError, message)
end

function Ivi_DequeueInstrSpecificError(vi, instrumentError, message)
    ccall((:Ivi_DequeueInstrSpecificError, libniscope), ViStatus, (ViSession, Ptr{ViInt32}, Ptr{ViChar}), vi, instrumentError, message)
end

function Ivi_ClearInstrSpecificErrorQueue(vi)
    ccall((:Ivi_ClearInstrSpecificErrorQueue, libniscope), ViStatus, (ViSession,), vi)
end

function Ivi_InstrSpecificErrorQueueSize(vi, numErrors)
    ccall((:Ivi_InstrSpecificErrorQueueSize, libniscope), ViStatus, (ViSession, Ptr{ViInt32}), vi, numErrors)
end

function Ivi_WriteInstrData(vi, writeBuffer)
    ccall((:Ivi_WriteInstrData, libniscope), ViStatus, (ViSession, ViConstString), vi, writeBuffer)
end

function Ivi_ReadInstrData(vi, numBytes, rdBuf, bytesRead)
    ccall((:Ivi_ReadInstrData, libniscope), ViStatus, (ViSession, ViInt32, Ptr{ViChar}, Ptr{ViInt32}), vi, numBytes, rdBuf, bytesRead)
end

function Ivi_ReadToFile(vi, filename, maxBytesToRead, fileAction, totalBytesWritten)
    ccall((:Ivi_ReadToFile, libniscope), ViStatus, (ViSession, ViConstString, ViInt32, ViInt32, Ptr{ViInt32}), vi, filename, maxBytesToRead, fileAction, totalBytesWritten)
end

function Ivi_WriteFromFile(vi, filename, maxBytesToWrite, byteOffset, totalBytesWritten)
    ccall((:Ivi_WriteFromFile, libniscope), ViStatus, (ViSession, ViConstString, ViInt32, ViInt32, Ptr{ViInt32}), vi, filename, maxBytesToWrite, byteOffset, totalBytesWritten)
end

function Ivi_viWrite(vi, buffer, countval, returnCount)
    ccall((:Ivi_viWrite, libniscope), ViStatus, (ViSession, Ptr{ViByte}, ViInt64, Ptr{ViInt64}), vi, buffer, countval, returnCount)
end

function Ivi_viRead(vi, bufferSize, buffer, returnCount)
    ccall((:Ivi_viRead, libniscope), ViStatus, (ViSession, ViInt64, Ptr{ViByte}, Ptr{ViInt64}), vi, bufferSize, buffer, returnCount)
end

function Ivi_PerformClassInterchangeCheck(vi, classAPI, funcName)
    ccall((:Ivi_PerformClassInterchangeCheck, libniscope), ViStatus, (ViSession, ViInt32, ViConstString), vi, classAPI, funcName)
end

function Ivi_ClassDriverNew(logicalOrVInstrName, classPrefix, functionList, vi)
    ccall((:Ivi_ClassDriverNew, libniscope), ViStatus, (ViConstString, ViConstString, Ptr{ViString}, Ptr{ViSession}), logicalOrVInstrName, classPrefix, functionList, vi)
end

function Ivi_ClassFunctionCapabilities(vi, functionTable, capabilityString, allFound)
    ccall((:Ivi_ClassFunctionCapabilities, libniscope), ViStatus, (ViSession, IviStringValueTable, Ptr{ViChar}, Ptr{ViBoolean}), vi, functionTable, capabilityString, allFound)
end

function Ivi_GetClassDriverStatusDesc(vi, statusCode, messageBuf, additionalTableToSearch)
    ccall((:Ivi_GetClassDriverStatusDesc, libniscope), ViStatus, (ViSession, ViStatus, Ptr{ViChar}, IviStringValueTable), vi, statusCode, messageBuf, additionalTableToSearch)
end

function Ivi_SpecificDriverSession(vi)
    ccall((:Ivi_SpecificDriverSession, libniscope), ViSession, (ViSession,), vi)
end

function Ivi_SetSpecificDriverSession(vi, specificDriver)
    ccall((:Ivi_SetSpecificDriverSession, libniscope), ViStatus, (ViSession, ViSession), vi, specificDriver)
end

function Ivi_LoadSimulationDriver(vi, defaultSwModule, functionList)
    ccall((:Ivi_LoadSimulationDriver, libniscope), ViStatus, (ViSession, ViConstString, Ptr{ViString}), vi, defaultSwModule, functionList)
end

function Ivi_GetSimulationSession(vi, simVi)
    ccall((:Ivi_GetSimulationSession, libniscope), ViStatus, (ViSession, Ptr{ViSession}), vi, simVi)
end

function Ivi_CloseSimulationSession(vi)
    ccall((:Ivi_CloseSimulationSession, libniscope), ViStatus, (ViSession,), vi)
end

function Ivi_GetFunctionPtr(vi, functionId, functionPtr)
    ccall((:Ivi_GetFunctionPtr, libniscope), ViStatus, (ViSession, ViInt32, Ptr{ViAddr}), vi, functionId, functionPtr)
end

function Ivi_GetFunctionPtrByName(vi, name, addPrefix, functionPtr)
    ccall((:Ivi_GetFunctionPtrByName, libniscope), ViStatus, (ViSession, ViConstString, ViBoolean, Ptr{ViAddr}), vi, name, addPrefix, functionPtr)
end

function Ivi_GetSimulationDriverFunctionPtr(vi, functionName, functionPtr)
    ccall((:Ivi_GetSimulationDriverFunctionPtr, libniscope), ViStatus, (ViSession, ViConstString, Ptr{ViAddr}), vi, functionName, functionPtr)
end

function Ivi_SimulationDriverNew(logicalName, vi)
    ccall((:Ivi_SimulationDriverNew, libniscope), ViStatus, (ViConstString, Ptr{ViSession}), logicalName, vi)
end

function Ivi_ApplySimulationDriverDefaultSetup(vi, name)
    ccall((:Ivi_ApplySimulationDriverDefaultSetup, libniscope), ViStatus, (ViSession, ViConstString), vi, name)
end

function Ivi_ValidateSession(vi)
    ccall((:Ivi_ValidateSession, libniscope), ViStatus, (ViSession,), vi)
end

function Ivi_SessionIsAvailable(vi)
    ccall((:Ivi_SessionIsAvailable, libniscope), ViBoolean, (ViSession,), vi)
end

function Ivi_Dispose(vi)
    ccall((:Ivi_Dispose, libniscope), ViStatus, (ViSession,), vi)
end

function Ivi_LockSession(vi, callerHasLock)
    ccall((:Ivi_LockSession, libniscope), ViStatus, (ViSession, Ptr{ViBoolean}), vi, callerHasLock)
end

function Ivi_UnlockSession(vi, callerHasLock)
    ccall((:Ivi_UnlockSession, libniscope), ViStatus, (ViSession, Ptr{ViBoolean}), vi, callerHasLock)
end

function Ivi_BuildChannelTable(vi, defaultChannelList, allowUnknownChannelStrings, chanStrValidationFunc)
    ccall((:Ivi_BuildChannelTable, libniscope), ViStatus, (ViSession, ViConstString, ViBoolean, Ivi_ValidateChannelStringFunc), vi, defaultChannelList, allowUnknownChannelStrings, chanStrValidationFunc)
end

function Ivi_AddToChannelTable(vi, channelStringsToAdd)
    ccall((:Ivi_AddToChannelTable, libniscope), ViStatus, (ViSession, ViConstString), vi, channelStringsToAdd)
end

function Ivi_RestrictAttrToChannels(vi, attributeId, channelNameList)
    ccall((:Ivi_RestrictAttrToChannels, libniscope), ViStatus, (ViSession, ViAttr, ViConstString), vi, attributeId, channelNameList)
end

function Ivi_ValidateAttrForChannel(vi, channelName, attributeId)
    ccall((:Ivi_ValidateAttrForChannel, libniscope), ViStatus, (ViSession, ViConstString, ViAttr), vi, channelName, attributeId)
end

function Ivi_CoerceChannelName(vi, channelName, channelString)
    ccall((:Ivi_CoerceChannelName, libniscope), ViStatus, (ViSession, ViConstString, Ptr{ViConstString}), vi, channelName, channelString)
end

function Ivi_GetChannelIndex(vi, channelName, index)
    ccall((:Ivi_GetChannelIndex, libniscope), ViStatus, (ViSession, ViConstString, Ptr{ViInt32}), vi, channelName, index)
end

function Ivi_GetNthChannelString(vi, index, channelString)
    ccall((:Ivi_GetNthChannelString, libniscope), ViStatus, (ViSession, ViInt32, Ptr{ViConstString}), vi, index, channelString)
end

function Ivi_GetUserChannelName(vi, channelString, userChannelName)
    ccall((:Ivi_GetUserChannelName, libniscope), ViStatus, (ViSession, ViConstString, Ptr{ViConstString}), vi, channelString, userChannelName)
end

function Ivi_BuildRepCapTable(vi, repCapName, namesval)
    ccall((:Ivi_BuildRepCapTable, libniscope), ViStatus, (ViSession, ViConstString, ViConstString), vi, repCapName, namesval)
end

function Ivi_AddToRepCapTable(vi, repCapName, namesToAdd)
    ccall((:Ivi_AddToRepCapTable, libniscope), ViStatus, (ViSession, ViConstString, ViConstString), vi, repCapName, namesToAdd)
end

function Ivi_RestrictAttrToInstances(vi, attributeId, instancesval)
    ccall((:Ivi_RestrictAttrToInstances, libniscope), ViStatus, (ViSession, ViAttr, ViConstString), vi, attributeId, instancesval)
end

function Ivi_ValidateAttrForRepCapName(vi, repCapName, attributeId)
    ccall((:Ivi_ValidateAttrForRepCapName, libniscope), ViStatus, (ViSession, ViConstString, ViAttr), vi, repCapName, attributeId)
end

function Ivi_CoerceRepCapName(vi, repCapName, name, actualNameRef)
    ccall((:Ivi_CoerceRepCapName, libniscope), ViStatus, (ViSession, ViConstString, ViConstString, Ptr{ViConstString}), vi, repCapName, name, actualNameRef)
end

function Ivi_GetRepCapIndex(vi, repCapName, name, indexRef)
    ccall((:Ivi_GetRepCapIndex, libniscope), ViStatus, (ViSession, ViConstString, ViConstString, Ptr{ViInt32}), vi, repCapName, name, indexRef)
end

function Ivi_GetNthRepCapName(vi, repCapName, index, nameRef)
    ccall((:Ivi_GetNthRepCapName, libniscope), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViConstString}), vi, repCapName, index, nameRef)
end

function Ivi_GetAttributeRepCapName(vi, attributeId, repCapName)
    ccall((:Ivi_GetAttributeRepCapName, libniscope), ViStatus, (ViSession, ViAttr, Ptr{ViConstString}), vi, attributeId, repCapName)
end

function Ivi_ValidateAttribute(vi, attrId, expectedType)
    ccall((:Ivi_ValidateAttribute, libniscope), ViStatus, (ViSession, ViAttr, IviValueType), vi, attrId, expectedType)
end

function Ivi_AttributeIsAvailable(vi, attrId)
    ccall((:Ivi_AttributeIsAvailable, libniscope), ViBoolean, (ViSession, ViAttr), vi, attrId)
end

function Ivi_ResetAttribute(vi, repCapName, attributeId)
    ccall((:Ivi_ResetAttribute, libniscope), ViStatus, (ViSession, ViConstString, ViAttr), vi, repCapName, attributeId)
end

function Ivi_DeleteAttribute(vi, attributeId)
    ccall((:Ivi_DeleteAttribute, libniscope), ViStatus, (ViSession, ViAttr), vi, attributeId)
end

function Ivi_AddAttributeViInt32(vi, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback, rangeTable)
    ccall((:Ivi_AddAttributeViInt32, libniscope), ViStatus, (ViSession, ViAttr, ViConstString, ViInt32, IviAttrFlags, ReadAttrViInt32_CallbackPtr, WriteAttrViInt32_CallbackPtr, IviRangeTablePtr), vi, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback, rangeTable)
end

function Ivi_AddAttributeViInt64(vi, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback, rangeTable)
    ccall((:Ivi_AddAttributeViInt64, libniscope), ViStatus, (ViSession, ViAttr, ViConstString, ViInt64, IviAttrFlags, ReadAttrViInt64_CallbackPtr, WriteAttrViInt64_CallbackPtr, IviRangeTablePtr), vi, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback, rangeTable)
end

function Ivi_AddAttributeViReal64(vi, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback, rangeTable, comparePrecision)
    ccall((:Ivi_AddAttributeViReal64, libniscope), ViStatus, (ViSession, ViAttr, ViConstString, ViReal64, IviAttrFlags, ReadAttrViReal64_CallbackPtr, WriteAttrViReal64_CallbackPtr, IviRangeTablePtr, ViInt32), vi, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback, rangeTable, comparePrecision)
end

function Ivi_AddAttributeViString(vi, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback)
    ccall((:Ivi_AddAttributeViString, libniscope), ViStatus, (ViSession, ViAttr, ViConstString, ViConstString, IviAttrFlags, ReadAttrViString_CallbackPtr, WriteAttrViString_CallbackPtr), vi, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback)
end

function Ivi_AddAttributeViBoolean(vi, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback)
    ccall((:Ivi_AddAttributeViBoolean, libniscope), ViStatus, (ViSession, ViAttr, ViConstString, ViBoolean, IviAttrFlags, ReadAttrViBoolean_CallbackPtr, WriteAttrViBoolean_CallbackPtr), vi, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback)
end

function Ivi_AddAttributeViSession(vi, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback)
    ccall((:Ivi_AddAttributeViSession, libniscope), ViStatus, (ViSession, ViAttr, ViConstString, ViSession, IviAttrFlags, ReadAttrViSession_CallbackPtr, WriteAttrViSession_CallbackPtr), vi, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback)
end

function Ivi_AddAttributeViAddr(vi, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback)
    ccall((:Ivi_AddAttributeViAddr, libniscope), ViStatus, (ViSession, ViAttr, ViConstString, ViAddr, IviAttrFlags, ReadAttrViAddr_CallbackPtr, WriteAttrViAddr_CallbackPtr), vi, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback)
end

function Ivi_AddRepeatedAttributeViInt32(vi, repCapName, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback, rangeTable)
    ccall((:Ivi_AddRepeatedAttributeViInt32, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViConstString, ViInt32, IviAttrFlags, ReadAttrViInt32_CallbackPtr, WriteAttrViInt32_CallbackPtr, IviRangeTablePtr), vi, repCapName, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback, rangeTable)
end

function Ivi_AddRepeatedAttributeViInt64(vi, repCapName, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback, rangeTable)
    ccall((:Ivi_AddRepeatedAttributeViInt64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViConstString, ViInt64, IviAttrFlags, ReadAttrViInt64_CallbackPtr, WriteAttrViInt64_CallbackPtr, IviRangeTablePtr), vi, repCapName, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback, rangeTable)
end

function Ivi_AddRepeatedAttributeViReal64(vi, repCapName, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback, rangeTable, comparePrecision)
    ccall((:Ivi_AddRepeatedAttributeViReal64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViConstString, ViReal64, IviAttrFlags, ReadAttrViReal64_CallbackPtr, WriteAttrViReal64_CallbackPtr, IviRangeTablePtr, ViInt32), vi, repCapName, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback, rangeTable, comparePrecision)
end

function Ivi_AddRepeatedAttributeViString(vi, repCapName, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback)
    ccall((:Ivi_AddRepeatedAttributeViString, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViConstString, ViConstString, IviAttrFlags, ReadAttrViString_CallbackPtr, WriteAttrViString_CallbackPtr), vi, repCapName, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback)
end

function Ivi_AddRepeatedAttributeViBoolean(vi, repCapName, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback)
    ccall((:Ivi_AddRepeatedAttributeViBoolean, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViConstString, ViBoolean, IviAttrFlags, ReadAttrViBoolean_CallbackPtr, WriteAttrViBoolean_CallbackPtr), vi, repCapName, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback)
end

function Ivi_AddRepeatedAttributeViSession(vi, repCapName, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback)
    ccall((:Ivi_AddRepeatedAttributeViSession, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViConstString, ViSession, IviAttrFlags, ReadAttrViSession_CallbackPtr, WriteAttrViSession_CallbackPtr), vi, repCapName, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback)
end

function Ivi_AddRepeatedAttributeViAddr(vi, repCapName, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback)
    ccall((:Ivi_AddRepeatedAttributeViAddr, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViConstString, ViAddr, IviAttrFlags, ReadAttrViAddr_CallbackPtr, WriteAttrViAddr_CallbackPtr), vi, repCapName, id, attrName, defaultValue, attributeFlags, readCallback, writeCallback)
end

function Ivi_SetAttributeViInt32(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_SetAttributeViInt32, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, ViInt32), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_SetAttributeViInt64(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_SetAttributeViInt64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, ViInt64), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_SetAttributeViReal64(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_SetAttributeViReal64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, ViReal64), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_SetAttributeViString(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_SetAttributeViString, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, ViConstString), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_SetAttributeViBoolean(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_SetAttributeViBoolean, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, ViBoolean), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_SetAttributeViSession(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_SetAttributeViSession, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, ViSession), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_SetAttributeViAddr(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_SetAttributeViAddr, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, ViAddr), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_CheckAttributeViInt32(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_CheckAttributeViInt32, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, ViInt32), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_CheckAttributeViInt64(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_CheckAttributeViInt64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, ViInt64), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_CheckAttributeViReal64(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_CheckAttributeViReal64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, ViReal64), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_CheckAttributeViString(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_CheckAttributeViString, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, ViConstString), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_CheckAttributeViBoolean(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_CheckAttributeViBoolean, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, ViBoolean), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_CheckAttributeViSession(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_CheckAttributeViSession, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, ViSession), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_CheckAttributeViAddr(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_CheckAttributeViAddr, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, ViAddr), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_GetAttributeViInt32(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_GetAttributeViInt32, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, Ptr{ViInt32}), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_GetAttributeViInt64(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_GetAttributeViInt64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, Ptr{ViInt64}), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_GetAttributeViReal64(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_GetAttributeViReal64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, Ptr{ViReal64}), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_GetAttributeViString(vi, repCapName, attributeId, optionFlags, bufSize, value)
    ccall((:Ivi_GetAttributeViString, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, ViInt32, Ptr{ViChar}), vi, repCapName, attributeId, optionFlags, bufSize, value)
end

function Ivi_GetAttributeViBoolean(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_GetAttributeViBoolean, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, Ptr{ViBoolean}), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_GetAttributeViSession(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_GetAttributeViSession, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, Ptr{ViSession}), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_GetAttributeViAddr(vi, repCapName, attributeId, optionFlags, value)
    ccall((:Ivi_GetAttributeViAddr, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, Ptr{ViAddr}), vi, repCapName, attributeId, optionFlags, value)
end

function Ivi_InvalidateAttribute(vi, repCapName, attributeId)
    ccall((:Ivi_InvalidateAttribute, libniscope), ViStatus, (ViSession, ViConstString, ViAttr), vi, repCapName, attributeId)
end

function Ivi_InvalidateAllAttributes(vi)
    ccall((:Ivi_InvalidateAllAttributes, libniscope), ViStatus, (ViSession,), vi)
end

function Ivi_AddAttributeInvalidation(vi, attributeId, attributeToInval, allChannels)
    ccall((:Ivi_AddAttributeInvalidation, libniscope), ViStatus, (ViSession, ViAttr, ViAttr, ViBoolean), vi, attributeId, attributeToInval, allChannels)
end

function Ivi_DeleteAttributeInvalidation(vi, attributeId, attributeToDelete)
    ccall((:Ivi_DeleteAttributeInvalidation, libniscope), ViStatus, (ViSession, ViAttr, ViAttr), vi, attributeId, attributeToDelete)
end

function Ivi_GetInvalidationList(vi, attributeId, invalList, numInvalEntries)
    ccall((:Ivi_GetInvalidationList, libniscope), ViStatus, (ViSession, ViAttr, Ptr{Ptr{IviInvalEntry}}, Ptr{ViInt32}), vi, attributeId, invalList, numInvalEntries)
end

function Ivi_DisposeInvalidationList(invalList)
    ccall((:Ivi_DisposeInvalidationList, libniscope), Cvoid, (Ptr{IviInvalEntry},), invalList)
end

function Ivi_AttributeIsCached(vi, repCapName, attributeId, instrStateIsCurrentlyCached)
    ccall((:Ivi_AttributeIsCached, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViBoolean}), vi, repCapName, attributeId, instrStateIsCurrentlyCached)
end

function Ivi_GetCoercedValViInt32(vi, repCapName, attributeId, value, coercedValue)
    ccall((:Ivi_GetCoercedValViInt32, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, Ptr{ViInt32}), vi, repCapName, attributeId, value, coercedValue)
end

function Ivi_GetCoercedValViReal64(vi, repCapName, attributeId, value, coercedValue)
    ccall((:Ivi_GetCoercedValViReal64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViReal64, Ptr{ViReal64}), vi, repCapName, attributeId, value, coercedValue)
end

function Ivi_GetNextCoercionInfo(vi, attributeId, attributeName, channelString, attrType, desiredValue, coercedValue)
    ccall((:Ivi_GetNextCoercionInfo, libniscope), ViStatus, (ViSession, Ptr{ViAttr}, Ptr{ViConstString}, Ptr{ViConstString}, Ptr{IviValueType}, Ptr{ViReal64}, Ptr{ViReal64}), vi, attributeId, attributeName, channelString, attrType, desiredValue, coercedValue)
end

function Ivi_GetNextCoercionString(vi, bufSize, coercion)
    ccall((:Ivi_GetNextCoercionString, libniscope), ViStatus, (ViSession, ViInt32, Ptr{ViChar}), vi, bufSize, coercion)
end

function Ivi_SetAttrRangeTableCallback(vi, attributeId, rangeTableCallback)
    ccall((:Ivi_SetAttrRangeTableCallback, libniscope), ViStatus, (ViSession, ViAttr, RangeTable_CallbackPtr), vi, attributeId, rangeTableCallback)
end

function Ivi_DefaultCheckCallbackViInt32(vi, repCapName, attributeId, value)
    ccall((:Ivi_DefaultCheckCallbackViInt32, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32), vi, repCapName, attributeId, value)
end

function Ivi_DefaultCoerceCallbackViInt32(vi, repCapName, attributeId, value, coercedValue)
    ccall((:Ivi_DefaultCoerceCallbackViInt32, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, Ptr{ViInt32}), vi, repCapName, attributeId, value, coercedValue)
end

function Ivi_DefaultCheckCallbackViInt64(vi, repCapName, attributeId, value)
    ccall((:Ivi_DefaultCheckCallbackViInt64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt64), vi, repCapName, attributeId, value)
end

function Ivi_DefaultCoerceCallbackViInt64(vi, repCapName, attributeId, value, coercedValue)
    ccall((:Ivi_DefaultCoerceCallbackViInt64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt64, Ptr{ViInt64}), vi, repCapName, attributeId, value, coercedValue)
end

function Ivi_DefaultCheckCallbackViReal64(vi, repCapName, attributeId, value)
    ccall((:Ivi_DefaultCheckCallbackViReal64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViReal64), vi, repCapName, attributeId, value)
end

function Ivi_DefaultCoerceCallbackViReal64(vi, repCapName, attributeId, value, coercedValue)
    ccall((:Ivi_DefaultCoerceCallbackViReal64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViReal64, Ptr{ViReal64}), vi, repCapName, attributeId, value, coercedValue)
end

function Ivi_DefaultCompareCallbackViReal64(vi, repCapName, attributeId, a, b, result)
    ccall((:Ivi_DefaultCompareCallbackViReal64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViReal64, ViReal64, Ptr{ViInt32}), vi, repCapName, attributeId, a, b, result)
end

function Ivi_DefaultCoerceCallbackViBoolean(vi, repCapName, attributeId, value, coercedValue)
    ccall((:Ivi_DefaultCoerceCallbackViBoolean, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViBoolean, Ptr{ViBoolean}), vi, repCapName, attributeId, value, coercedValue)
end

function Ivi_SetAttrReadCallbackViInt32(vi, attributeId, readCallback)
    ccall((:Ivi_SetAttrReadCallbackViInt32, libniscope), ViStatus, (ViSession, ViAttr, ReadAttrViInt32_CallbackPtr), vi, attributeId, readCallback)
end

function Ivi_SetAttrReadCallbackViInt64(vi, attributeId, readCallback)
    ccall((:Ivi_SetAttrReadCallbackViInt64, libniscope), ViStatus, (ViSession, ViAttr, ReadAttrViInt64_CallbackPtr), vi, attributeId, readCallback)
end

function Ivi_SetAttrReadCallbackViReal64(vi, attributeId, readCallback)
    ccall((:Ivi_SetAttrReadCallbackViReal64, libniscope), ViStatus, (ViSession, ViAttr, ReadAttrViReal64_CallbackPtr), vi, attributeId, readCallback)
end

function Ivi_SetAttrReadCallbackViString(vi, attributeId, readCallback)
    ccall((:Ivi_SetAttrReadCallbackViString, libniscope), ViStatus, (ViSession, ViAttr, ReadAttrViString_CallbackPtr), vi, attributeId, readCallback)
end

function Ivi_SetAttrReadCallbackViBoolean(vi, attributeId, readCallback)
    ccall((:Ivi_SetAttrReadCallbackViBoolean, libniscope), ViStatus, (ViSession, ViAttr, ReadAttrViBoolean_CallbackPtr), vi, attributeId, readCallback)
end

function Ivi_SetAttrReadCallbackViSession(vi, attributeId, readCallback)
    ccall((:Ivi_SetAttrReadCallbackViSession, libniscope), ViStatus, (ViSession, ViAttr, ReadAttrViSession_CallbackPtr), vi, attributeId, readCallback)
end

function Ivi_SetAttrReadCallbackViAddr(vi, attributeId, readCallback)
    ccall((:Ivi_SetAttrReadCallbackViAddr, libniscope), ViStatus, (ViSession, ViAttr, ReadAttrViAddr_CallbackPtr), vi, attributeId, readCallback)
end

function Ivi_SetAttrWriteCallbackViInt32(vi, attributeId, writeCallback)
    ccall((:Ivi_SetAttrWriteCallbackViInt32, libniscope), ViStatus, (ViSession, ViAttr, WriteAttrViInt32_CallbackPtr), vi, attributeId, writeCallback)
end

function Ivi_SetAttrWriteCallbackViInt64(vi, attributeId, writeCallback)
    ccall((:Ivi_SetAttrWriteCallbackViInt64, libniscope), ViStatus, (ViSession, ViAttr, WriteAttrViInt64_CallbackPtr), vi, attributeId, writeCallback)
end

function Ivi_SetAttrWriteCallbackViReal64(vi, attributeId, writeCallback)
    ccall((:Ivi_SetAttrWriteCallbackViReal64, libniscope), ViStatus, (ViSession, ViAttr, WriteAttrViReal64_CallbackPtr), vi, attributeId, writeCallback)
end

function Ivi_SetAttrWriteCallbackViString(vi, attributeId, writeCallback)
    ccall((:Ivi_SetAttrWriteCallbackViString, libniscope), ViStatus, (ViSession, ViAttr, WriteAttrViString_CallbackPtr), vi, attributeId, writeCallback)
end

function Ivi_SetAttrWriteCallbackViBoolean(vi, attributeId, writeCallback)
    ccall((:Ivi_SetAttrWriteCallbackViBoolean, libniscope), ViStatus, (ViSession, ViAttr, WriteAttrViBoolean_CallbackPtr), vi, attributeId, writeCallback)
end

function Ivi_SetAttrWriteCallbackViSession(vi, attributeId, writeCallback)
    ccall((:Ivi_SetAttrWriteCallbackViSession, libniscope), ViStatus, (ViSession, ViAttr, WriteAttrViSession_CallbackPtr), vi, attributeId, writeCallback)
end

function Ivi_SetAttrWriteCallbackViAddr(vi, attributeId, writeCallback)
    ccall((:Ivi_SetAttrWriteCallbackViAddr, libniscope), ViStatus, (ViSession, ViAttr, WriteAttrViAddr_CallbackPtr), vi, attributeId, writeCallback)
end

function Ivi_SetAttrCheckCallbackViInt32(vi, attributeId, checkCallback)
    ccall((:Ivi_SetAttrCheckCallbackViInt32, libniscope), ViStatus, (ViSession, ViAttr, CheckAttrViInt32_CallbackPtr), vi, attributeId, checkCallback)
end

function Ivi_SetAttrCheckCallbackViInt64(vi, attributeId, checkCallback)
    ccall((:Ivi_SetAttrCheckCallbackViInt64, libniscope), ViStatus, (ViSession, ViAttr, CheckAttrViInt64_CallbackPtr), vi, attributeId, checkCallback)
end

function Ivi_SetAttrCheckCallbackViReal64(vi, attributeId, checkCallback)
    ccall((:Ivi_SetAttrCheckCallbackViReal64, libniscope), ViStatus, (ViSession, ViAttr, CheckAttrViReal64_CallbackPtr), vi, attributeId, checkCallback)
end

function Ivi_SetAttrCheckCallbackViString(vi, attributeId, checkCallback)
    ccall((:Ivi_SetAttrCheckCallbackViString, libniscope), ViStatus, (ViSession, ViAttr, CheckAttrViString_CallbackPtr), vi, attributeId, checkCallback)
end

function Ivi_SetAttrCheckCallbackViBoolean(vi, attributeId, checkCallback)
    ccall((:Ivi_SetAttrCheckCallbackViBoolean, libniscope), ViStatus, (ViSession, ViAttr, CheckAttrViBoolean_CallbackPtr), vi, attributeId, checkCallback)
end

function Ivi_SetAttrCheckCallbackViSession(vi, attributeId, checkCallback)
    ccall((:Ivi_SetAttrCheckCallbackViSession, libniscope), ViStatus, (ViSession, ViAttr, CheckAttrViSession_CallbackPtr), vi, attributeId, checkCallback)
end

function Ivi_SetAttrCheckCallbackViAddr(vi, attributeId, checkCallback)
    ccall((:Ivi_SetAttrCheckCallbackViAddr, libniscope), ViStatus, (ViSession, ViAttr, CheckAttrViAddr_CallbackPtr), vi, attributeId, checkCallback)
end

function Ivi_SetAttrCoerceCallbackViInt32(vi, attributeId, coerceCallback)
    ccall((:Ivi_SetAttrCoerceCallbackViInt32, libniscope), ViStatus, (ViSession, ViAttr, CoerceAttrViInt32_CallbackPtr), vi, attributeId, coerceCallback)
end

function Ivi_SetAttrCoerceCallbackViInt64(vi, attributeId, coerceCallback)
    ccall((:Ivi_SetAttrCoerceCallbackViInt64, libniscope), ViStatus, (ViSession, ViAttr, CoerceAttrViInt64_CallbackPtr), vi, attributeId, coerceCallback)
end

function Ivi_SetAttrCoerceCallbackViReal64(vi, attributeId, coerceCallback)
    ccall((:Ivi_SetAttrCoerceCallbackViReal64, libniscope), ViStatus, (ViSession, ViAttr, CoerceAttrViReal64_CallbackPtr), vi, attributeId, coerceCallback)
end

function Ivi_SetAttrCoerceCallbackViString(vi, attributeId, coerceCallback)
    ccall((:Ivi_SetAttrCoerceCallbackViString, libniscope), ViStatus, (ViSession, ViAttr, CoerceAttrViString_CallbackPtr), vi, attributeId, coerceCallback)
end

function Ivi_SetAttrCoerceCallbackViBoolean(vi, attributeId, coerceCallback)
    ccall((:Ivi_SetAttrCoerceCallbackViBoolean, libniscope), ViStatus, (ViSession, ViAttr, CoerceAttrViBoolean_CallbackPtr), vi, attributeId, coerceCallback)
end

function Ivi_SetAttrCoerceCallbackViAddr(vi, attributeId, coerceCallback)
    ccall((:Ivi_SetAttrCoerceCallbackViAddr, libniscope), ViStatus, (ViSession, ViAttr, CoerceAttrViAddr_CallbackPtr), vi, attributeId, coerceCallback)
end

function Ivi_SetAttrCoerceCallbackViSession(vi, attributeId, coerceCallback)
    ccall((:Ivi_SetAttrCoerceCallbackViSession, libniscope), ViStatus, (ViSession, ViAttr, CoerceAttrViSession_CallbackPtr), vi, attributeId, coerceCallback)
end

function Ivi_SetAttrCompareCallbackViInt32(vi, attributeId, compareCallback)
    ccall((:Ivi_SetAttrCompareCallbackViInt32, libniscope), ViStatus, (ViSession, ViAttr, CompareAttrViInt32_CallbackPtr), vi, attributeId, compareCallback)
end

function Ivi_SetAttrCompareCallbackViInt64(vi, attributeId, compareCallback)
    ccall((:Ivi_SetAttrCompareCallbackViInt64, libniscope), ViStatus, (ViSession, ViAttr, CompareAttrViInt64_CallbackPtr), vi, attributeId, compareCallback)
end

function Ivi_SetAttrCompareCallbackViReal64(vi, attributeId, compareCallback)
    ccall((:Ivi_SetAttrCompareCallbackViReal64, libniscope), ViStatus, (ViSession, ViAttr, CompareAttrViReal64_CallbackPtr), vi, attributeId, compareCallback)
end

function Ivi_SetAttrCompareCallbackViString(vi, attributeId, compareCallback)
    ccall((:Ivi_SetAttrCompareCallbackViString, libniscope), ViStatus, (ViSession, ViAttr, CompareAttrViString_CallbackPtr), vi, attributeId, compareCallback)
end

function Ivi_SetAttrCompareCallbackViBoolean(vi, attributeId, compareCallback)
    ccall((:Ivi_SetAttrCompareCallbackViBoolean, libniscope), ViStatus, (ViSession, ViAttr, CompareAttrViBoolean_CallbackPtr), vi, attributeId, compareCallback)
end

function Ivi_SetAttrCompareCallbackViSession(vi, attributeId, compareCallback)
    ccall((:Ivi_SetAttrCompareCallbackViSession, libniscope), ViStatus, (ViSession, ViAttr, CompareAttrViSession_CallbackPtr), vi, attributeId, compareCallback)
end

function Ivi_SetAttrCompareCallbackViAddr(vi, attributeId, compareCallback)
    ccall((:Ivi_SetAttrCompareCallbackViAddr, libniscope), ViStatus, (ViSession, ViAttr, CompareAttrViAddr_CallbackPtr), vi, attributeId, compareCallback)
end

function Ivi_IOSession(vi)
    ccall((:Ivi_IOSession, libniscope), ViSession, (ViSession,), vi)
end

function Ivi_RangeChecking(vi)
    ccall((:Ivi_RangeChecking, libniscope), ViBoolean, (ViSession,), vi)
end

function Ivi_QueryInstrStatus(vi)
    ccall((:Ivi_QueryInstrStatus, libniscope), ViBoolean, (ViSession,), vi)
end

function Ivi_Simulating(vi)
    ccall((:Ivi_Simulating, libniscope), ViBoolean, (ViSession,), vi)
end

function Ivi_UseSpecificSimulation(vi)
    ccall((:Ivi_UseSpecificSimulation, libniscope), ViBoolean, (ViSession,), vi)
end

function Ivi_Spying(vi)
    ccall((:Ivi_Spying, libniscope), ViBoolean, (ViSession,), vi)
end

function Ivi_InterchangeCheck(vi)
    ccall((:Ivi_InterchangeCheck, libniscope), ViBoolean, (ViSession,), vi)
end

function Ivi_SetAttrComparePrecision(vi, attributeId, comparePrecision)
    ccall((:Ivi_SetAttrComparePrecision, libniscope), ViStatus, (ViSession, ViAttr, ViInt32), vi, attributeId, comparePrecision)
end

function Ivi_GetAttrComparePrecision(vi, attributeId, comparePrecision)
    ccall((:Ivi_GetAttrComparePrecision, libniscope), ViStatus, (ViSession, ViAttr, Ptr{ViInt32}), vi, attributeId, comparePrecision)
end

function Ivi_GetNumAttributes(vi, numAttributes)
    ccall((:Ivi_GetNumAttributes, libniscope), ViStatus, (ViSession, Ptr{ViInt32}), vi, numAttributes)
end

function Ivi_GetNthAttribute(vi, index, attribute)
    ccall((:Ivi_GetNthAttribute, libniscope), ViStatus, (ViSession, ViInt32, Ptr{ViAttr}), vi, index, attribute)
end

function Ivi_GetAttributeFlags(vi, attributeId, flags)
    ccall((:Ivi_GetAttributeFlags, libniscope), ViStatus, (ViSession, ViAttr, Ptr{IviAttrFlags}), vi, attributeId, flags)
end

function Ivi_SetAttributeFlags(iviSession, attributeId, flags)
    ccall((:Ivi_SetAttributeFlags, libniscope), ViStatus, (ViSession, ViAttr, IviAttrFlags), iviSession, attributeId, flags)
end

function Ivi_GetAttributeType(vi, attributeId, typ)
    ccall((:Ivi_GetAttributeType, libniscope), ViStatus, (ViSession, ViAttr, Ptr{IviValueType}), vi, attributeId, typ)
end

function Ivi_GetAttributeName(vi, attributeId, nameBuf, bufSize)
    ccall((:Ivi_GetAttributeName, libniscope), ViStatus, (ViSession, ViAttr, Ptr{ViChar}, ViInt32), vi, attributeId, nameBuf, bufSize)
end

function Ivi_GetAttrMinMaxViInt32(vi, repCapName, attr, minval, maxval, hasMin, hasMax)
    ccall((:Ivi_GetAttrMinMaxViInt32, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViBoolean}, Ptr{ViBoolean}), vi, repCapName, attr, minval, maxval, hasMin, hasMax)
end

function Ivi_GetAttrMinMaxViInt64(vi, repCapName, attr, minval, maxval, hasMin, hasMax)
    ccall((:Ivi_GetAttrMinMaxViInt64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViInt64}, Ptr{ViInt64}, Ptr{ViBoolean}, Ptr{ViBoolean}), vi, repCapName, attr, minval, maxval, hasMin, hasMax)
end

function Ivi_GetAttrMinMaxViReal64(vi, repCapName, attr, minval, maxval, hasMin, hasMax)
    ccall((:Ivi_GetAttrMinMaxViReal64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViBoolean}, Ptr{ViBoolean}), vi, repCapName, attr, minval, maxval, hasMin, hasMax)
end

function Ivi_AttributeWasSetByUser(vi, repCapName, attributeId)
    ccall((:Ivi_AttributeWasSetByUser, libniscope), ViBoolean, (ViSession, ViConstString, ViAttr), vi, repCapName, attributeId)
end

function Ivi_AttributeEverSetByUser(vi, repCapName, attributeId)
    ccall((:Ivi_AttributeEverSetByUser, libniscope), ViBoolean, (ViSession, ViConstString, ViAttr), vi, repCapName, attributeId)
end

function Ivi_SetErrorInfo(vi, overWrite, primaryError, secondaryError, errorElaboration)
    ccall((:Ivi_SetErrorInfo, libniscope), ViStatus, (ViSession, ViBoolean, ViStatus, ViStatus, ViConstString), vi, overWrite, primaryError, secondaryError, errorElaboration)
end

function Ivi_GetErrorInfo(vi, primaryError, secondaryError, errorElaboration)
    ccall((:Ivi_GetErrorInfo, libniscope), ViStatus, (ViSession, Ptr{ViStatus}, Ptr{ViStatus}, Ptr{ViChar}), vi, primaryError, secondaryError, errorElaboration)
end

function Ivi_ClearErrorInfo(vi)
    ccall((:Ivi_ClearErrorInfo, libniscope), ViStatus, (ViSession,), vi)
end

function Ivi_GetErrorMessage(statusCode, messageBuf)
    ccall((:Ivi_GetErrorMessage, libniscope), ViStatus, (ViStatus, Ptr{ViChar}), statusCode, messageBuf)
end

function Ivi_GetAttrRangeTable(vi, repCapName, attributeId, rangeTable)
    ccall((:Ivi_GetAttrRangeTable, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{IviRangeTablePtr}), vi, repCapName, attributeId, rangeTable)
end

function Ivi_ValidateRangeTable(rangeTable)
    ccall((:Ivi_ValidateRangeTable, libniscope), ViStatus, (IviRangeTablePtr,), rangeTable)
end

function Ivi_GetRangeTableNumEntries(table, numEntries)
    ccall((:Ivi_GetRangeTableNumEntries, libniscope), ViStatus, (IviRangeTablePtr, Ptr{ViInt32}), table, numEntries)
end

function Ivi_GetViInt32EntryFromValue(value, table, discreteOrMin, maxval, coercedValue, tableIndex, cmdString, cmdValue)
    ccall((:Ivi_GetViInt32EntryFromValue, libniscope), ViStatus, (ViInt32, IviRangeTablePtr, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViString}, Ptr{ViInt32}), value, table, discreteOrMin, maxval, coercedValue, tableIndex, cmdString, cmdValue)
end

function Ivi_GetViInt32EntryFromString(cmdString, table, discreteOrMin, maxval, coercedValue, tableIndex, cmdValue)
    ccall((:Ivi_GetViInt32EntryFromString, libniscope), ViStatus, (ViConstString, IviRangeTablePtr, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}), cmdString, table, discreteOrMin, maxval, coercedValue, tableIndex, cmdValue)
end

function Ivi_GetViInt32EntryFromIndex(tableIndex, table, discreteOrMin, maxval, coercedValue, cmdString, cmdValue)
    ccall((:Ivi_GetViInt32EntryFromIndex, libniscope), ViStatus, (ViInt32, IviRangeTablePtr, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViString}, Ptr{ViInt32}), tableIndex, table, discreteOrMin, maxval, coercedValue, cmdString, cmdValue)
end

function Ivi_GetViInt32EntryFromCmdValue(cmdValue, table, discreteOrMin, maxval, coercedValue, tableIndex, cmdString)
    ccall((:Ivi_GetViInt32EntryFromCmdValue, libniscope), ViStatus, (ViInt32, IviRangeTablePtr, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViString}), cmdValue, table, discreteOrMin, maxval, coercedValue, tableIndex, cmdString)
end

function Ivi_GetViInt32EntryFromCoercedVal(coercedValue, table, discreteOrMin, maxval, tableIndex, cmdString, cmdValue)
    ccall((:Ivi_GetViInt32EntryFromCoercedVal, libniscope), ViStatus, (ViInt32, IviRangeTablePtr, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViString}, Ptr{ViInt32}), coercedValue, table, discreteOrMin, maxval, tableIndex, cmdString, cmdValue)
end

function Ivi_GetViInt64EntryFromValue(value, table, discreteOrMin, maxval, coercedValue, tableIndex, cmdString, cmdValue)
    ccall((:Ivi_GetViInt64EntryFromValue, libniscope), ViStatus, (ViInt64, IviRangeTablePtr, Ptr{ViInt64}, Ptr{ViInt64}, Ptr{ViInt64}, Ptr{ViInt32}, Ptr{ViString}, Ptr{ViInt32}), value, table, discreteOrMin, maxval, coercedValue, tableIndex, cmdString, cmdValue)
end

function Ivi_GetViInt64EntryFromString(cmdString, table, discreteOrMin, maxval, coercedValue, tableIndex, cmdValue)
    ccall((:Ivi_GetViInt64EntryFromString, libniscope), ViStatus, (ViConstString, IviRangeTablePtr, Ptr{ViInt64}, Ptr{ViInt64}, Ptr{ViInt64}, Ptr{ViInt32}, Ptr{ViInt32}), cmdString, table, discreteOrMin, maxval, coercedValue, tableIndex, cmdValue)
end

function Ivi_GetViInt64EntryFromIndex(tableIndex, table, discreteOrMin, maxval, coercedValue, cmdString, cmdValue)
    ccall((:Ivi_GetViInt64EntryFromIndex, libniscope), ViStatus, (ViInt32, IviRangeTablePtr, Ptr{ViInt64}, Ptr{ViInt64}, Ptr{ViInt64}, Ptr{ViString}, Ptr{ViInt32}), tableIndex, table, discreteOrMin, maxval, coercedValue, cmdString, cmdValue)
end

function Ivi_GetViInt64EntryFromCmdValue(cmdValue, table, discreteOrMin, maxval, coercedValue, tableIndex, cmdString)
    ccall((:Ivi_GetViInt64EntryFromCmdValue, libniscope), ViStatus, (ViInt32, IviRangeTablePtr, Ptr{ViInt64}, Ptr{ViInt64}, Ptr{ViInt64}, Ptr{ViInt32}, Ptr{ViString}), cmdValue, table, discreteOrMin, maxval, coercedValue, tableIndex, cmdString)
end

function Ivi_GetViInt64EntryFromCoercedVal(coercedValue, table, discreteOrMin, maxval, tableIndex, cmdString, cmdValue)
    ccall((:Ivi_GetViInt64EntryFromCoercedVal, libniscope), ViStatus, (ViInt64, IviRangeTablePtr, Ptr{ViInt64}, Ptr{ViInt64}, Ptr{ViInt32}, Ptr{ViString}, Ptr{ViInt32}), coercedValue, table, discreteOrMin, maxval, tableIndex, cmdString, cmdValue)
end

function Ivi_GetViReal64EntryFromValue(value, table, discreteOrMin, maxval, coercedValue, tableIndex, cmdString, cmdValue)
    ccall((:Ivi_GetViReal64EntryFromValue, libniscope), ViStatus, (ViReal64, IviRangeTablePtr, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViInt32}, Ptr{ViString}, Ptr{ViInt32}), value, table, discreteOrMin, maxval, coercedValue, tableIndex, cmdString, cmdValue)
end

function Ivi_GetViReal64EntryFromString(cmdString, table, discreteOrMin, maxval, coercedValue, tableIndex, cmdValue)
    ccall((:Ivi_GetViReal64EntryFromString, libniscope), ViStatus, (ViConstString, IviRangeTablePtr, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViInt32}, Ptr{ViInt32}), cmdString, table, discreteOrMin, maxval, coercedValue, tableIndex, cmdValue)
end

function Ivi_GetViReal64EntryFromIndex(tableIndex, table, discreteOrMin, maxval, coercedValue, cmdString, cmdValue)
    ccall((:Ivi_GetViReal64EntryFromIndex, libniscope), ViStatus, (ViInt32, IviRangeTablePtr, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViString}, Ptr{ViInt32}), tableIndex, table, discreteOrMin, maxval, coercedValue, cmdString, cmdValue)
end

function Ivi_GetViReal64EntryFromCmdValue(cmdVal, table, discreteOrMin, maxval, coercedValue, tableIndex, cmdString)
    ccall((:Ivi_GetViReal64EntryFromCmdValue, libniscope), ViStatus, (ViInt32, IviRangeTablePtr, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViInt32}, Ptr{ViString}), cmdVal, table, discreteOrMin, maxval, coercedValue, tableIndex, cmdString)
end

function Ivi_GetViReal64EntryFromCoercedVal(coercedValue, table, discreteOrMin, maxval, tableIndex, cmdString, cmdValue)
    ccall((:Ivi_GetViReal64EntryFromCoercedVal, libniscope), ViStatus, (ViReal64, IviRangeTablePtr, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViInt32}, Ptr{ViString}, Ptr{ViInt32}), coercedValue, table, discreteOrMin, maxval, tableIndex, cmdString, cmdValue)
end

function Ivi_GetStoredRangeTablePtr(vi, attributeId, rangeTable)
    ccall((:Ivi_GetStoredRangeTablePtr, libniscope), ViStatus, (ViSession, ViAttr, Ptr{IviRangeTablePtr}), vi, attributeId, rangeTable)
end

function Ivi_SetStoredRangeTablePtr(vi, attributeId, rangeTable)
    ccall((:Ivi_SetStoredRangeTablePtr, libniscope), ViStatus, (ViSession, ViAttr, IviRangeTablePtr), vi, attributeId, rangeTable)
end

function Ivi_RangeTableNew(vi, numRangeValueEntries, typ, hasMin, hasMax, rangeTable)
    ccall((:Ivi_RangeTableNew, libniscope), ViStatus, (ViSession, ViInt32, ViInt32, ViBoolean, ViBoolean, Ptr{IviRangeTablePtr}), vi, numRangeValueEntries, typ, hasMin, hasMax, rangeTable)
end

function Ivi_RangeTableFree(vi, rangeTable, freeCmdStrings)
    ccall((:Ivi_RangeTableFree, libniscope), ViStatus, (ViSession, IviRangeTablePtr, ViBoolean), vi, rangeTable, freeCmdStrings)
end

function Ivi_SetRangeTableEntry(rangeTable, tableIndex, discreteOrMin, maxval, coercedValue, cmdString, cmdValue)
    ccall((:Ivi_SetRangeTableEntry, libniscope), ViStatus, (IviRangeTablePtr, ViInt32, ViReal64, ViReal64, ViReal64, ViConstString, ViInt32), rangeTable, tableIndex, discreteOrMin, maxval, coercedValue, cmdString, cmdValue)
end

function Ivi_SetRangeTableEntryViInt64(rangeTable, tableIndex, discreteOrMin, maxval, coercedValue, cmdString, cmdValue)
    ccall((:Ivi_SetRangeTableEntryViInt64, libniscope), ViStatus, (IviRangeTablePtr, ViInt32, ViInt64, ViInt64, ViInt64, ViConstString, ViInt32), rangeTable, tableIndex, discreteOrMin, maxval, coercedValue, cmdString, cmdValue)
end

function Ivi_SetRangeTableEnd(rangeTable, endIndex)
    ccall((:Ivi_SetRangeTableEnd, libniscope), ViStatus, (IviRangeTablePtr, ViInt32), rangeTable, endIndex)
end

function Ivi_GetConfigStoreHandle(handle)
    ccall((:Ivi_GetConfigStoreHandle, libniscope), ViStatus, (Ptr{IviConfigStoreHandle},), handle)
end

function Ivi_AttachToConfigStoreHandle(handle, discardExistingHandle)
    ccall((:Ivi_AttachToConfigStoreHandle, libniscope), ViStatus, (IviConfigStoreHandle, ViBoolean), handle, discardExistingHandle)
end

function Ivi_GetInfoFromResourceName(resourceName, optionString, newResourceName, newOptionString, isLogicalName)
    ccall((:Ivi_GetInfoFromResourceName, libniscope), ViStatus, (ViRsrc, ViString, Ptr{ViChar}, Ptr{ViChar}, Ptr{ViBoolean}), resourceName, optionString, newResourceName, newOptionString, isLogicalName)
end

function Ivi_GetLogicalNamesList(logicalNamesList, numLogicalNames)
    ccall((:Ivi_GetLogicalNamesList, libniscope), ViStatus, (Ptr{Ptr{IviLogicalNameEntry}}, Ptr{ViInt32}), logicalNamesList, numLogicalNames)
end

function Ivi_GetNthLogicalName(logicalNamesList, index, nameBuf, bufSize, fromFile)
    ccall((:Ivi_GetNthLogicalName, libniscope), ViStatus, (Ptr{IviLogicalNameEntry}, ViInt32, Ptr{ViChar}, ViInt32, Ptr{ViBoolean}), logicalNamesList, index, nameBuf, bufSize, fromFile)
end

function Ivi_DisposeLogicalNamesList(logicalNamesList)
    ccall((:Ivi_DisposeLogicalNamesList, libniscope), Cvoid, (Ptr{IviLogicalNameEntry},), logicalNamesList)
end

function Ivi_GetNextInterchangeCheckString(vi, bufSize, interchangeWarning)
    ccall((:Ivi_GetNextInterchangeCheckString, libniscope), ViStatus, (ViSession, ViInt32, Ptr{ViChar}), vi, bufSize, interchangeWarning)
end

function Ivi_ClearInterchangeWarnings(vi)
    ccall((:Ivi_ClearInterchangeWarnings, libniscope), ViStatus, (ViSession,), vi)
end

function Ivi_ResetInterchangeCheck(vi)
    ccall((:Ivi_ResetInterchangeCheck, libniscope), ViStatus, (ViSession,), vi)
end

function Ivi_LogInterchangeWarning(vi, warningType, funcEnum, repCapName, attributeId, elab)
    ccall((:Ivi_LogInterchangeWarning, libniscope), ViStatus, (ViSession, ViInt32, ViInt32, ViConstString, ViAttr, ViConstString), vi, warningType, funcEnum, repCapName, attributeId, elab)
end

function Ivi_Alloc(vi, memBlockSize, memBlockPtr)
    ccall((:Ivi_Alloc, libniscope), ViStatus, (ViSession, ViInt32, Ptr{ViAddr}), vi, memBlockSize, memBlockPtr)
end

function Ivi_Free(vi, memBlockPtr)
    ccall((:Ivi_Free, libniscope), ViStatus, (ViSession, ViAddr), vi, memBlockPtr)
end

function Ivi_FreeAll(vi)
    ccall((:Ivi_FreeAll, libniscope), ViStatus, (ViSession,), vi)
end

function Ivi_SetValInStringCallback(vi, attributeId, value)
    ccall((:Ivi_SetValInStringCallback, libniscope), ViStatus, (ViSession, ViAttr, ViConstString), vi, attributeId, value)
end

function Ivi_GetStringFromTable(table, value, stringval)
    ccall((:Ivi_GetStringFromTable, libniscope), ViStatus, (IviStringValueTable, ViInt32, Ptr{ViString}), table, value, stringval)
end

function Ivi_GetValueFromTable(table, stringval, value)
    ccall((:Ivi_GetValueFromTable, libniscope), ViStatus, (IviStringValueTable, ViConstString, Ptr{ViInt32}), table, stringval, value)
end

function Ivi_CheckNumericRange(value, minval, maxval, errorCode)
    ccall((:Ivi_CheckNumericRange, libniscope), ViStatus, (ViReal64, ViReal64, ViReal64, ViStatus), value, minval, maxval, errorCode)
end

function Ivi_CheckBooleanRange(value, errorCode)
    ccall((:Ivi_CheckBooleanRange, libniscope), ViStatus, (ViBoolean, ViStatus), value, errorCode)
end

function Ivi_CoerceBoolean(value)
    ccall((:Ivi_CoerceBoolean, libniscope), ViStatus, (Ptr{ViBoolean},), value)
end

function Ivi_CompareWithPrecision(comparePrecision, a, b, result)
    ccall((:Ivi_CompareWithPrecision, libniscope), ViStatus, (ViInt32, ViReal64, ViReal64, Ptr{ViInt32}), comparePrecision, a, b, result)
end

function Ivi_GetViReal64Type(number, typeOfDouble)
    ccall((:Ivi_GetViReal64Type, libniscope), ViStatus, (ViReal64, Ptr{ViInt32}), number, typeOfDouble)
end

function Ivi_GetPtrToSpecialViReal64Value(typeOfDouble)
    ccall((:Ivi_GetPtrToSpecialViReal64Value, libniscope), Ptr{ViReal64}, (ViInt32,), typeOfDouble)
end

function Ivi_LockSession_Class(vi, callerHasLock)
    ccall((:Ivi_LockSession_Class, libniscope), ViStatus, (ViSession, Ptr{ViBoolean}), vi, callerHasLock)
end

function Ivi_UnlockSession_Class(vi, callerHasLock)
    ccall((:Ivi_UnlockSession_Class, libniscope), ViStatus, (ViSession, Ptr{ViBoolean}), vi, callerHasLock)
end

function Ivi_SetAttrCallback(vi, attributeId, attrType, callbackType, callback)
    ccall((:Ivi_SetAttrCallback, libniscope), ViStatus, (ViSession, ViAttr, IviValueType, IviCallbackType, ViAddr), vi, attributeId, attrType, callbackType, callback)
end

function Ivi_GetAttrCallback(vi, attributeId, attrType, callbackType, callback)
    ccall((:Ivi_GetAttrCallback, libniscope), ViStatus, (ViSession, ViAttr, IviValueType, IviCallbackType, Ptr{ViAddr}), vi, attributeId, attrType, callbackType, callback)
end

function Ivi_GetErrorMessageLocalized(statusCode, locale, bufSize, messageBuf)
    ccall((:Ivi_GetErrorMessageLocalized, libniscope), ViStatus, (ViStatus, ViUInt32, ViInt32, Ptr{ViChar}), statusCode, locale, bufSize, messageBuf)
end

function Ivi_GetSpyingFromLogicalName(logicalName, isSpying)
    ccall((:Ivi_GetSpyingFromLogicalName, libniscope), ViStatus, (ViConstString, Ptr{ViBoolean}), logicalName, isSpying)
end

function Ivi_LogInterchangeWarning2(vi, warningType, funcName, repCapName, attributeId, elab)
    ccall((:Ivi_LogInterchangeWarning2, libniscope), ViStatus, (ViSession, ViInt32, ViConstString, ViConstString, ViAttr, ViConstString), vi, warningType, funcName, repCapName, attributeId, elab)
end

function Ivi_ParamPositionError(parameterPosition)
    ccall((:Ivi_ParamPositionError, libniscope), ViStatus, (ViInt32,), parameterPosition)
end

function Ivi_DefaultBufferedIOCallback(vi, message)
    ccall((:Ivi_DefaultBufferedIOCallback, libniscope), ViStatus, (ViSession, IviMessage), vi, message)
end

function Ivi_AttributeUpdateIsPending(vi, repCapName, attributeId, updatePending)
    ccall((:Ivi_AttributeUpdateIsPending, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViBoolean}), vi, repCapName, attributeId, updatePending)
end

function Ivi_Update(vi)
    ccall((:Ivi_Update, libniscope), ViStatus, (ViSession,), vi)
end

function Ivi_BufWrite(vi, buf, countval, rc)
    ccall((:Ivi_BufWrite, libniscope), ViStatus, (ViSession, ViBuf, ViUInt32, Ptr{ViUInt32}), vi, buf, countval, rc)
end

function Ivi_InterchangeCheckAttribute(vi, repCapName, attrId, method, funcEnum)
    ccall((:Ivi_InterchangeCheckAttribute, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, ViInt32), vi, repCapName, attrId, method, funcEnum)
end

function Ivi_PerformInterchangeCheck(vi, attributes, funcEnum)
    ccall((:Ivi_PerformInterchangeCheck, libniscope), ViStatus, (ViSession, IviStringValueTable, ViInt32), vi, attributes, funcEnum)
end

function Ivi_SetInterchangeCheckMethod(vi, repCapName, attrId, method)
    ccall((:Ivi_SetInterchangeCheckMethod, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32), vi, repCapName, attrId, method)
end

function IviDCPwr_InterchangeCheck(vi, funcName)
    ccall((:IviDCPwr_InterchangeCheck, libniscope), Cvoid, (ViSession, ViConstString), vi, funcName)
end

function IviDmm_InterchangeCheck(vi, funcName)
    ccall((:IviDmm_InterchangeCheck, libniscope), Cvoid, (ViSession, ViConstString), vi, funcName)
end

function IviFgen_InterchangeCheck(vi, funcName)
    ccall((:IviFgen_InterchangeCheck, libniscope), Cvoid, (ViSession, ViConstString), vi, funcName)
end

function IviScope_InterchangeCheck(vi, funcName)
    ccall((:IviScope_InterchangeCheck, libniscope), Cvoid, (ViSession, ViConstString), vi, funcName)
end

function IviSwtch_InterchangeCheck(vi, funcName)
    ccall((:IviSwtch_InterchangeCheck, libniscope), Cvoid, (ViSession, ViConstString), vi, funcName)
end

function IviDmm_DisableUnusedExtensions(vi, funcName)
    ccall((:IviDmm_DisableUnusedExtensions, libniscope), Cvoid, (ViSession, ViConstString), vi, funcName)
end

function IviFgen_DisableUnusedExtensions(vi, funcName)
    ccall((:IviFgen_DisableUnusedExtensions, libniscope), Cvoid, (ViSession, ViConstString), vi, funcName)
end

function IviScope_DisableUnusedExtensions(vi, funcName)
    ccall((:IviScope_DisableUnusedExtensions, libniscope), Cvoid, (ViSession, ViConstString), vi, funcName)
end