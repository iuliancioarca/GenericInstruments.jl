# Julia wrapper for header: IviScope.h
# Automatically generated using Clang.jl


function IviScope_init(logicalName, idQuery, resetDevice, vi)
    ccall((:IviScope_init, libniscope), ViStatus, (ViRsrc, ViBoolean, ViBoolean, Ptr{ViSession}), logicalName, idQuery, resetDevice, vi)
end

function IviScope_close(vi)
    ccall((:IviScope_close, libniscope), ViStatus, (ViSession,), vi)
end

function IviScope_reset(vi)
    ccall((:IviScope_reset, libniscope), ViStatus, (ViSession,), vi)
end

function IviScope_self_test(vi, selfTestResult, selfTestMessage)
    ccall((:IviScope_self_test, libniscope), ViStatus, (ViSession, Ptr{ViInt16}, Ptr{ViChar}), vi, selfTestResult, selfTestMessage)
end

function IviScope_error_query(vi, errorCode, errorMessage)
    ccall((:IviScope_error_query, libniscope), ViStatus, (ViSession, Ptr{ViInt32}, Ptr{ViChar}), vi, errorCode, errorMessage)
end

function IviScope_error_message(vi, statusCode, message)
    ccall((:IviScope_error_message, libniscope), ViStatus, (ViSession, ViStatus, Ptr{ViChar}), vi, statusCode, message)
end

function IviScope_revision_query(vi, driverRev, instrRev)
    ccall((:IviScope_revision_query, libniscope), ViStatus, (ViSession, Ptr{ViChar}, Ptr{ViChar}), vi, driverRev, instrRev)
end

function IviScope_InvalidateAllAttributes(vi)
    ccall((:IviScope_InvalidateAllAttributes, libniscope), ViStatus, (ViSession,), vi)
end

function IviScope_ResetWithDefaults(vi)
    ccall((:IviScope_ResetWithDefaults, libniscope), ViStatus, (ViSession,), vi)
end

function IviScope_Disable(vi)
    ccall((:IviScope_Disable, libniscope), ViStatus, (ViSession,), vi)
end

function IviScope_InitWithOptions(logicalName, IDQuery, resetDevice, optionString, vi)
    ccall((:IviScope_InitWithOptions, libniscope), ViStatus, (ViRsrc, ViBoolean, ViBoolean, ViConstString, Ptr{ViSession}), logicalName, IDQuery, resetDevice, optionString, vi)
end

function IviScope_GetAttributeViInt32(vi, channelName, attributeId, value)
    ccall((:IviScope_GetAttributeViInt32, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViInt32}), vi, channelName, attributeId, value)
end

function IviScope_SetAttributeViInt32(vi, channelName, attributeId, value)
    ccall((:IviScope_SetAttributeViInt32, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32), vi, channelName, attributeId, value)
end

function IviScope_CheckAttributeViInt32(vi, channelName, attributeId, value)
    ccall((:IviScope_CheckAttributeViInt32, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32), vi, channelName, attributeId, value)
end

function IviScope_GetAttributeViInt64(vi, channelName, attributeId, value)
    ccall((:IviScope_GetAttributeViInt64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViInt64}), vi, channelName, attributeId, value)
end

function IviScope_SetAttributeViInt64(vi, channelName, attributeId, value)
    ccall((:IviScope_SetAttributeViInt64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt64), vi, channelName, attributeId, value)
end

function IviScope_CheckAttributeViInt64(vi, channelName, attributeId, value)
    ccall((:IviScope_CheckAttributeViInt64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt64), vi, channelName, attributeId, value)
end

function IviScope_GetAttributeViReal64(vi, channelName, attributeId, value)
    ccall((:IviScope_GetAttributeViReal64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViReal64}), vi, channelName, attributeId, value)
end

function IviScope_SetAttributeViReal64(vi, channelName, attributeId, value)
    ccall((:IviScope_SetAttributeViReal64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViReal64), vi, channelName, attributeId, value)
end

function IviScope_CheckAttributeViReal64(vi, channelName, attributeId, value)
    ccall((:IviScope_CheckAttributeViReal64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViReal64), vi, channelName, attributeId, value)
end

function IviScope_GetAttributeViString(vi, channelName, attributeId, bufferSize, value)
    ccall((:IviScope_GetAttributeViString, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, Ptr{ViChar}), vi, channelName, attributeId, bufferSize, value)
end

function IviScope_SetAttributeViString(vi, channelName, attributeId, value)
    ccall((:IviScope_SetAttributeViString, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViConstString), vi, channelName, attributeId, value)
end

function IviScope_CheckAttributeViString(vi, channelName, attributeId, value)
    ccall((:IviScope_CheckAttributeViString, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViConstString), vi, channelName, attributeId, value)
end

function IviScope_GetAttributeViBoolean(vi, channelName, attributeId, value)
    ccall((:IviScope_GetAttributeViBoolean, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViBoolean}), vi, channelName, attributeId, value)
end

function IviScope_SetAttributeViBoolean(vi, channelName, attributeId, value)
    ccall((:IviScope_SetAttributeViBoolean, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViBoolean), vi, channelName, attributeId, value)
end

function IviScope_CheckAttributeViBoolean(vi, channelName, attributeId, value)
    ccall((:IviScope_CheckAttributeViBoolean, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViBoolean), vi, channelName, attributeId, value)
end

function IviScope_GetAttributeViSession(vi, channelName, attributeId, value)
    ccall((:IviScope_GetAttributeViSession, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViSession}), vi, channelName, attributeId, value)
end

function IviScope_SetAttributeViSession(vi, channelName, attributeId, value)
    ccall((:IviScope_SetAttributeViSession, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViSession), vi, channelName, attributeId, value)
end

function IviScope_CheckAttributeViSession(vi, channelName, attributeId, value)
    ccall((:IviScope_CheckAttributeViSession, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViSession), vi, channelName, attributeId, value)
end

function IviScope_LockSession(vi, callerHasLock)
    ccall((:IviScope_LockSession, libniscope), ViStatus, (ViSession, Ptr{ViBoolean}), vi, callerHasLock)
end

function IviScope_UnlockSession(vi, callerHasLock)
    ccall((:IviScope_UnlockSession, libniscope), ViStatus, (ViSession, Ptr{ViBoolean}), vi, callerHasLock)
end

function IviScope_GetError(vi, errorCode, bufferSize, description)
    ccall((:IviScope_GetError, libniscope), ViStatus, (ViSession, Ptr{ViStatus}, ViInt32, Ptr{ViChar}), vi, errorCode, bufferSize, description)
end

function IviScope_ClearError(vi)
    ccall((:IviScope_ClearError, libniscope), ViStatus, (ViSession,), vi)
end

function IviScope_GetNextInterchangeWarning(vi, bufferSize, warning)
    ccall((:IviScope_GetNextInterchangeWarning, libniscope), ViStatus, (ViSession, ViInt32, Ptr{ViChar}), vi, bufferSize, warning)
end

function IviScope_ClearInterchangeWarnings(vi)
    ccall((:IviScope_ClearInterchangeWarnings, libniscope), ViStatus, (ViSession,), vi)
end

function IviScope_ResetInterchangeCheck(vi)
    ccall((:IviScope_ResetInterchangeCheck, libniscope), ViStatus, (ViSession,), vi)
end

function IviScope_GetNextCoercionRecord(vi, bufferSize, record)
    ccall((:IviScope_GetNextCoercionRecord, libniscope), ViStatus, (ViSession, ViInt32, Ptr{ViChar}), vi, bufferSize, record)
end

function IviScope_GetSpecificDriverCHandle(vi, specificDriverCHandle)
    ccall((:IviScope_GetSpecificDriverCHandle, libniscope), ViStatus, (ViSession, Ptr{ViSession}), vi, specificDriverCHandle)
end

function IviScope_GetSpecificDriverIUnknownPtr(vi, specificDriverIUnknownPtr)
    ccall((:IviScope_GetSpecificDriverIUnknownPtr, libniscope), ViStatus, (ViSession, Ptr{Cvoid}), vi, specificDriverIUnknownPtr)
end

function IviScope_ConfigureChannel(vi, channel, vrange, offset, coupling, probeAttenuation, enabled)
    ccall((:IviScope_ConfigureChannel, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViReal64, ViInt32, ViReal64, ViBoolean), vi, channel, vrange, offset, coupling, probeAttenuation, enabled)
end

function IviScope_ConfigureChanCharacteristics(vi, channel, inputImpedance, maxInputFrequency)
    ccall((:IviScope_ConfigureChanCharacteristics, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViReal64), vi, channel, inputImpedance, maxInputFrequency)
end

function IviScope_ConfigureAcquisitionType(vi, acquisitionType)
    ccall((:IviScope_ConfigureAcquisitionType, libniscope), ViStatus, (ViSession, ViInt32), vi, acquisitionType)
end

function IviScope_ConfigureAcquisitionRecord(vi, timePerRecord, minimumRecordLength, acqStartTime)
    ccall((:IviScope_ConfigureAcquisitionRecord, libniscope), ViStatus, (ViSession, ViReal64, ViInt32, ViReal64), vi, timePerRecord, minimumRecordLength, acqStartTime)
end

function IviScope_ActualRecordLength(vi, actualRecordLength)
    ccall((:IviScope_ActualRecordLength, libniscope), ViStatus, (ViSession, Ptr{ViInt32}), vi, actualRecordLength)
end

function IviScope_SampleRate(vi, sampleRate)
    ccall((:IviScope_SampleRate, libniscope), ViStatus, (ViSession, Ptr{ViReal64}), vi, sampleRate)
end

function IviScope_ConfigureTrigger(vi, triggerType, holdoff)
    ccall((:IviScope_ConfigureTrigger, libniscope), ViStatus, (ViSession, ViInt32, ViReal64), vi, triggerType, holdoff)
end

function IviScope_ConfigureTriggerCoupling(vi, coupling)
    ccall((:IviScope_ConfigureTriggerCoupling, libniscope), ViStatus, (ViSession, ViInt32), vi, coupling)
end

function IviScope_ConfigureEdgeTriggerSource(vi, source, level, slope)
    ccall((:IviScope_ConfigureEdgeTriggerSource, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViInt32), vi, source, level, slope)
end

function IviScope_ReadWaveform(vi, channel, waveformSize, maxTime, waveform, actualPoints, initialX, xIncrement)
    ccall((:IviScope_ReadWaveform, libniscope), ViStatus, (ViSession, ViConstString, ViInt32, ViInt32, Ptr{ViReal64}, Ptr{ViInt32}, Ptr{ViReal64}, Ptr{ViReal64}), vi, channel, waveformSize, maxTime, waveform, actualPoints, initialX, xIncrement)
end

function IviScope_Abort(vi)
    ccall((:IviScope_Abort, libniscope), ViStatus, (ViSession,), vi)
end

function IviScope_InitiateAcquisition(vi)
    ccall((:IviScope_InitiateAcquisition, libniscope), ViStatus, (ViSession,), vi)
end

function IviScope_AcquisitionStatus(vi, status)
    ccall((:IviScope_AcquisitionStatus, libniscope), ViStatus, (ViSession, Ptr{ViInt32}), vi, status)
end

function IviScope_FetchWaveform(vi, channel, waveformSize, waveform, actualPoints, initialX, xIncrement)
    ccall((:IviScope_FetchWaveform, libniscope), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViReal64}, Ptr{ViInt32}, Ptr{ViReal64}, Ptr{ViReal64}), vi, channel, waveformSize, waveform, actualPoints, initialX, xIncrement)
end

function IviScope_IsInvalidWfmElement(vi, elementValue, isInvalid)
    ccall((:IviScope_IsInvalidWfmElement, libniscope), ViStatus, (ViSession, ViReal64, Ptr{ViBoolean}), vi, elementValue, isInvalid)
end

function IviScope_GetChannelName(vi, index, bufferSize, name)
    ccall((:IviScope_GetChannelName, libniscope), ViStatus, (ViSession, ViInt32, ViInt32, Ptr{ViChar}), vi, index, bufferSize, name)
end

function IviScope_ConfigureTVTriggerSource(vi, source, TVSignalFormat, TVEvent, TVPolarity)
    ccall((:IviScope_ConfigureTVTriggerSource, libniscope), ViStatus, (ViSession, ViConstString, ViInt32, ViInt32, ViInt32), vi, source, TVSignalFormat, TVEvent, TVPolarity)
end

function IviScope_ConfigureTVTriggerLineNumber(vi, lineNumber)
    ccall((:IviScope_ConfigureTVTriggerLineNumber, libniscope), ViStatus, (ViSession, ViInt32), vi, lineNumber)
end

function IviScope_ConfigureRuntTriggerSource(vi, source, runtLowThreshold, runtHighThreshold, runtPolarity)
    ccall((:IviScope_ConfigureRuntTriggerSource, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViReal64, ViInt32), vi, source, runtLowThreshold, runtHighThreshold, runtPolarity)
end

function IviScope_ConfigureGlitchTriggerSource(vi, source, level, glitchWidth, glitchPolarity, glitchCondition)
    ccall((:IviScope_ConfigureGlitchTriggerSource, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViReal64, ViInt32, ViInt32), vi, source, level, glitchWidth, glitchPolarity, glitchCondition)
end

function IviScope_ConfigureWidthTriggerSource(vi, source, level, widthLowThreshold, widthHighThreshold, widthPolarity, widthCondition)
    ccall((:IviScope_ConfigureWidthTriggerSource, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViReal64, ViReal64, ViInt32, ViInt32), vi, source, level, widthLowThreshold, widthHighThreshold, widthPolarity, widthCondition)
end

function IviScope_ConfigureAcLineTriggerSlope(vi, slope)
    ccall((:IviScope_ConfigureAcLineTriggerSlope, libniscope), ViStatus, (ViSession, ViInt32), vi, slope)
end

function IviScope_ConfigureTriggerModifier(vi, triggerModifier)
    ccall((:IviScope_ConfigureTriggerModifier, libniscope), ViStatus, (ViSession, ViInt32), vi, triggerModifier)
end

function IviScope_ConfigureNumEnvelopes(vi, numberOfEnvelopes)
    ccall((:IviScope_ConfigureNumEnvelopes, libniscope), ViStatus, (ViSession, ViInt32), vi, numberOfEnvelopes)
end

function IviScope_ReadMinMaxWaveform(vi, channel, waveformSize, maxTime, minWaveform, maxWaveform, actualPoints, initialX, xIncrement)
    ccall((:IviScope_ReadMinMaxWaveform, libniscope), ViStatus, (ViSession, ViConstString, ViInt32, ViInt32, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViInt32}, Ptr{ViReal64}, Ptr{ViReal64}), vi, channel, waveformSize, maxTime, minWaveform, maxWaveform, actualPoints, initialX, xIncrement)
end

function IviScope_FetchMinMaxWaveform(vi, channel, waveformSize, minWaveform, maxWaveform, actualPoints, initialX, xIncrement)
    ccall((:IviScope_FetchMinMaxWaveform, libniscope), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViInt32}, Ptr{ViReal64}, Ptr{ViReal64}), vi, channel, waveformSize, minWaveform, maxWaveform, actualPoints, initialX, xIncrement)
end

function IviScope_ConfigureRefLevels(vi, lowRef, midRef, highRef)
    ccall((:IviScope_ConfigureRefLevels, libniscope), ViStatus, (ViSession, ViReal64, ViReal64, ViReal64), vi, lowRef, midRef, highRef)
end

function IviScope_ReadWaveformMeasurement(vi, channel, measurementFunction, maxTime, measurement)
    ccall((:IviScope_ReadWaveformMeasurement, libniscope), ViStatus, (ViSession, ViConstString, ViInt32, ViInt32, Ptr{ViReal64}), vi, channel, measurementFunction, maxTime, measurement)
end

function IviScope_FetchWaveformMeasurement(vi, channel, measurementFunction, measurement)
    ccall((:IviScope_FetchWaveformMeasurement, libniscope), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViReal64}), vi, channel, measurementFunction, measurement)
end

function IviScope_ConfigureNumAverages(vi, numberOfAverages)
    ccall((:IviScope_ConfigureNumAverages, libniscope), ViStatus, (ViSession, ViInt32), vi, numberOfAverages)
end

function IviScope_ConfigureInitiateContinuous(vi, continuousAcquisition)
    ccall((:IviScope_ConfigureInitiateContinuous, libniscope), ViStatus, (ViSession, ViBoolean), vi, continuousAcquisition)
end

function IviScope_ConfigureInterpolation(vi, interpolation)
    ccall((:IviScope_ConfigureInterpolation, libniscope), ViStatus, (ViSession, ViInt32), vi, interpolation)
end

function IviScope_SampleMode(vi, sampleMode)
    ccall((:IviScope_SampleMode, libniscope), ViStatus, (ViSession, Ptr{ViInt32}), vi, sampleMode)
end

function IviScope_AutoProbeSenseValue(vi, channel, autoProbeSenseValue)
    ccall((:IviScope_AutoProbeSenseValue, libniscope), ViStatus, (ViSession, ViConstString, Ptr{ViReal64}), vi, channel, autoProbeSenseValue)
end

function IviScope_AutoSetup(vi)
    ccall((:IviScope_AutoSetup, libniscope), ViStatus, (ViSession,), vi)
end