# Julia wrapper for header: IviDmm.h
# Automatically generated using Clang.jl


function IviDmm_init(logicalName, idQuery, resetDevice, vi)
    ccall((:IviDmm_init, libnidmm), ViStatus, (ViRsrc, ViBoolean, ViBoolean, Ptr{ViSession}), logicalName, idQuery, resetDevice, vi)
end

function IviDmm_close(vi)
    ccall((:IviDmm_close, libnidmm), ViStatus, (ViSession,), vi)
end

function IviDmm_reset(vi)
    ccall((:IviDmm_reset, libnidmm), ViStatus, (ViSession,), vi)
end

function IviDmm_self_test(vi, selfTestResult, selfTestMessage)
    ccall((:IviDmm_self_test, libnidmm), ViStatus, (ViSession, Ptr{ViInt16}, Ptr{ViChar}), vi, selfTestResult, selfTestMessage)
end

function IviDmm_error_query(vi, errorCode, errorMessage)
    ccall((:IviDmm_error_query, libnidmm), ViStatus, (ViSession, Ptr{ViInt32}, Ptr{ViChar}), vi, errorCode, errorMessage)
end

function IviDmm_error_message(vi, statusCode, message)
    ccall((:IviDmm_error_message, libnidmm), ViStatus, (ViSession, ViStatus, Ptr{ViChar}), vi, statusCode, message)
end

function IviDmm_revision_query(vi, driverRev, instrRev)
    ccall((:IviDmm_revision_query, libnidmm), ViStatus, (ViSession, Ptr{ViChar}, Ptr{ViChar}), vi, driverRev, instrRev)
end

function IviDmm_InvalidateAllAttributes(vi)
    ccall((:IviDmm_InvalidateAllAttributes, libnidmm), ViStatus, (ViSession,), vi)
end

function IviDmm_ResetWithDefaults(vi)
    ccall((:IviDmm_ResetWithDefaults, libnidmm), ViStatus, (ViSession,), vi)
end

function IviDmm_Disable(vi)
    ccall((:IviDmm_Disable, libnidmm), ViStatus, (ViSession,), vi)
end

function IviDmm_InitWithOptions(logicalName, IDQuery, resetDevice, optionString, vi)
    ccall((:IviDmm_InitWithOptions, libnidmm), ViStatus, (ViRsrc, ViBoolean, ViBoolean, ViConstString, Ptr{ViSession}), logicalName, IDQuery, resetDevice, optionString, vi)
end

function IviDmm_GetAttributeViInt32(vi, channelName, attributeId, value)
    ccall((:IviDmm_GetAttributeViInt32, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViInt32}), vi, channelName, attributeId, value)
end

function IviDmm_SetAttributeViInt32(vi, channelName, attributeId, value)
    ccall((:IviDmm_SetAttributeViInt32, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32), vi, channelName, attributeId, value)
end

function IviDmm_CheckAttributeViInt32(vi, channelName, attributeId, value)
    ccall((:IviDmm_CheckAttributeViInt32, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32), vi, channelName, attributeId, value)
end

function IviDmm_GetAttributeViInt64(vi, channelName, attributeId, value)
    ccall((:IviDmm_GetAttributeViInt64, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViInt64}), vi, channelName, attributeId, value)
end

function IviDmm_SetAttributeViInt64(vi, channelName, attributeId, value)
    ccall((:IviDmm_SetAttributeViInt64, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViInt64), vi, channelName, attributeId, value)
end

function IviDmm_CheckAttributeViInt64(vi, channelName, attributeId, value)
    ccall((:IviDmm_CheckAttributeViInt64, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViInt64), vi, channelName, attributeId, value)
end

function IviDmm_GetAttributeViReal64(vi, channelName, attributeId, value)
    ccall((:IviDmm_GetAttributeViReal64, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViReal64}), vi, channelName, attributeId, value)
end

function IviDmm_SetAttributeViReal64(vi, channelName, attributeId, value)
    ccall((:IviDmm_SetAttributeViReal64, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViReal64), vi, channelName, attributeId, value)
end

function IviDmm_CheckAttributeViReal64(vi, channelName, attributeId, value)
    ccall((:IviDmm_CheckAttributeViReal64, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViReal64), vi, channelName, attributeId, value)
end

function IviDmm_GetAttributeViString(vi, channelName, attributeId, bufferSize, value)
    ccall((:IviDmm_GetAttributeViString, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, Ptr{ViChar}), vi, channelName, attributeId, bufferSize, value)
end

function IviDmm_SetAttributeViString(vi, channelName, attributeId, value)
    ccall((:IviDmm_SetAttributeViString, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViConstString), vi, channelName, attributeId, value)
end

function IviDmm_CheckAttributeViString(vi, channelName, attributeId, value)
    ccall((:IviDmm_CheckAttributeViString, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViConstString), vi, channelName, attributeId, value)
end

function IviDmm_GetAttributeViBoolean(vi, channelName, attributeId, value)
    ccall((:IviDmm_GetAttributeViBoolean, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViBoolean}), vi, channelName, attributeId, value)
end

function IviDmm_SetAttributeViBoolean(vi, channelName, attributeId, value)
    ccall((:IviDmm_SetAttributeViBoolean, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViBoolean), vi, channelName, attributeId, value)
end

function IviDmm_CheckAttributeViBoolean(vi, channelName, attributeId, value)
    ccall((:IviDmm_CheckAttributeViBoolean, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViBoolean), vi, channelName, attributeId, value)
end

function IviDmm_GetAttributeViSession(vi, channelName, attributeId, value)
    ccall((:IviDmm_GetAttributeViSession, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViSession}), vi, channelName, attributeId, value)
end

function IviDmm_SetAttributeViSession(vi, channelName, attributeId, value)
    ccall((:IviDmm_SetAttributeViSession, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViSession), vi, channelName, attributeId, value)
end

function IviDmm_CheckAttributeViSession(vi, channelName, attributeId, value)
    ccall((:IviDmm_CheckAttributeViSession, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViSession), vi, channelName, attributeId, value)
end

function IviDmm_LockSession(vi, callerHasLock)
    ccall((:IviDmm_LockSession, libnidmm), ViStatus, (ViSession, Ptr{ViBoolean}), vi, callerHasLock)
end

function IviDmm_UnlockSession(vi, callerHasLock)
    ccall((:IviDmm_UnlockSession, libnidmm), ViStatus, (ViSession, Ptr{ViBoolean}), vi, callerHasLock)
end

function IviDmm_GetError(vi, errorCode, bufferSize, description)
    ccall((:IviDmm_GetError, libnidmm), ViStatus, (ViSession, Ptr{ViStatus}, ViInt32, Ptr{ViChar}), vi, errorCode, bufferSize, description)
end

function IviDmm_ClearError(vi)
    ccall((:IviDmm_ClearError, libnidmm), ViStatus, (ViSession,), vi)
end

function IviDmm_GetNextInterchangeWarning(vi, bufferSize, warning)
    ccall((:IviDmm_GetNextInterchangeWarning, libnidmm), ViStatus, (ViSession, ViInt32, Ptr{ViChar}), vi, bufferSize, warning)
end

function IviDmm_ClearInterchangeWarnings(vi)
    ccall((:IviDmm_ClearInterchangeWarnings, libnidmm), ViStatus, (ViSession,), vi)
end

function IviDmm_ResetInterchangeCheck(vi)
    ccall((:IviDmm_ResetInterchangeCheck, libnidmm), ViStatus, (ViSession,), vi)
end

function IviDmm_GetNextCoercionRecord(vi, bufferSize, record)
    ccall((:IviDmm_GetNextCoercionRecord, libnidmm), ViStatus, (ViSession, ViInt32, Ptr{ViChar}), vi, bufferSize, record)
end

function IviDmm_GetSpecificDriverCHandle(vi, specificDriverCHandle)
    ccall((:IviDmm_GetSpecificDriverCHandle, libnidmm), ViStatus, (ViSession, Ptr{ViSession}), vi, specificDriverCHandle)
end

function IviDmm_GetSpecificDriverIUnknownPtr(vi, specificDriverIUnknownPtr)
    ccall((:IviDmm_GetSpecificDriverIUnknownPtr, libnidmm), ViStatus, (ViSession, Ptr{Cvoid}), vi, specificDriverIUnknownPtr)
end

function IviDmm_ConfigureMeasurement(vi, _function, range, resolution)
    ccall((:IviDmm_ConfigureMeasurement, libnidmm), ViStatus, (ViSession, ViInt32, ViReal64, ViReal64), vi, _function, range, resolution)
end

function IviDmm_ConfigureTrigger(vi, triggerSource, triggerDelay)
    ccall((:IviDmm_ConfigureTrigger, libnidmm), ViStatus, (ViSession, ViInt32, ViReal64), vi, triggerSource, triggerDelay)
end

function IviDmm_Read(vi, maxTime, reading)
    ccall((:IviDmm_Read, libnidmm), ViStatus, (ViSession, ViInt32, Ptr{ViReal64}), vi, maxTime, reading)
end

function IviDmm_Fetch(vi, maxTime, reading)
    ccall((:IviDmm_Fetch, libnidmm), ViStatus, (ViSession, ViInt32, Ptr{ViReal64}), vi, maxTime, reading)
end

function IviDmm_Abort(vi)
    ccall((:IviDmm_Abort, libnidmm), ViStatus, (ViSession,), vi)
end

function IviDmm_Initiate(vi)
    ccall((:IviDmm_Initiate, libnidmm), ViStatus, (ViSession,), vi)
end

function IviDmm_IsOverRange(vi, measurementValue, isOverRange)
    ccall((:IviDmm_IsOverRange, libnidmm), ViStatus, (ViSession, ViReal64, Ptr{ViBoolean}), vi, measurementValue, isOverRange)
end

function IviDmm_ConfigureACBandwidth(vi, minFreq, maxFreq)
    ccall((:IviDmm_ConfigureACBandwidth, libnidmm), ViStatus, (ViSession, ViReal64, ViReal64), vi, minFreq, maxFreq)
end

function IviDmm_ConfigureFrequencyVoltageRange(vi, frequencyVoltageRange)
    ccall((:IviDmm_ConfigureFrequencyVoltageRange, libnidmm), ViStatus, (ViSession, ViReal64), vi, frequencyVoltageRange)
end

function IviDmm_ConfigureTransducerType(vi, transducerType)
    ccall((:IviDmm_ConfigureTransducerType, libnidmm), ViStatus, (ViSession, ViInt32), vi, transducerType)
end

function IviDmm_ConfigureFixedRefJunction(vi, fixedRefJunction)
    ccall((:IviDmm_ConfigureFixedRefJunction, libnidmm), ViStatus, (ViSession, ViReal64), vi, fixedRefJunction)
end

function IviDmm_ConfigureThermocouple(vi, thermocoupleType, refJunctionType)
    ccall((:IviDmm_ConfigureThermocouple, libnidmm), ViStatus, (ViSession, ViInt32, ViInt32), vi, thermocoupleType, refJunctionType)
end

function IviDmm_ConfigureRTD(vi, alpha, resistance)
    ccall((:IviDmm_ConfigureRTD, libnidmm), ViStatus, (ViSession, ViReal64, ViReal64), vi, alpha, resistance)
end

function IviDmm_ConfigureThermistor(vi, resistance)
    ccall((:IviDmm_ConfigureThermistor, libnidmm), ViStatus, (ViSession, ViReal64), vi, resistance)
end

function IviDmm_ConfigureMeasCompleteDest(vi, measCompleteDest)
    ccall((:IviDmm_ConfigureMeasCompleteDest, libnidmm), ViStatus, (ViSession, ViInt32), vi, measCompleteDest)
end

function IviDmm_ConfigureMultiPoint(vi, triggerCount, sampleCount, sampleTrigger, sampleInterval)
    ccall((:IviDmm_ConfigureMultiPoint, libnidmm), ViStatus, (ViSession, ViInt32, ViInt32, ViInt32, ViReal64), vi, triggerCount, sampleCount, sampleTrigger, sampleInterval)
end

function IviDmm_ReadMultiPoint(vi, maxTime, arraySize, readingArray, actualPts)
    ccall((:IviDmm_ReadMultiPoint, libnidmm), ViStatus, (ViSession, ViInt32, ViInt32, Ptr{ViReal64}, Ptr{ViInt32}), vi, maxTime, arraySize, readingArray, actualPts)
end

function IviDmm_FetchMultiPoint(vi, maxTime, arraySize, readingArray, actualPts)
    ccall((:IviDmm_FetchMultiPoint, libnidmm), ViStatus, (ViSession, ViInt32, ViInt32, Ptr{ViReal64}, Ptr{ViInt32}), vi, maxTime, arraySize, readingArray, actualPts)
end

function IviDmm_ConfigureTriggerSlope(vi, polarity)
    ccall((:IviDmm_ConfigureTriggerSlope, libnidmm), ViStatus, (ViSession, ViInt32), vi, polarity)
end

function IviDmm_SendSoftwareTrigger(vi)
    ccall((:IviDmm_SendSoftwareTrigger, libnidmm), ViStatus, (ViSession,), vi)
end

function IviDmm_GetApertureTimeInfo(vi, apertureTime, apertureTimeUnits)
    ccall((:IviDmm_GetApertureTimeInfo, libnidmm), ViStatus, (ViSession, Ptr{ViReal64}, Ptr{ViInt32}), vi, apertureTime, apertureTimeUnits)
end

function IviDmm_GetAutoRangeValue(vi, autoRangeValue)
    ccall((:IviDmm_GetAutoRangeValue, libnidmm), ViStatus, (ViSession, Ptr{ViReal64}), vi, autoRangeValue)
end

function IviDmm_ConfigureAutoZeroMode(vi, autoZeroMode)
    ccall((:IviDmm_ConfigureAutoZeroMode, libnidmm), ViStatus, (ViSession, ViInt32), vi, autoZeroMode)
end

function IviDmm_ConfigurePowerLineFrequency(vi, powerLineFreq)
    ccall((:IviDmm_ConfigurePowerLineFrequency, libnidmm), ViStatus, (ViSession, ViReal64), vi, powerLineFreq)
end