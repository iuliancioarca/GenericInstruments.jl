# Julia wrapper for header: IviFgen.h
# Automatically generated using Clang.jl


function IviFgen_init(logicalName, IDQuery, resetDevice, vi)
    ccall((:IviFgen_init, libnifgen), ViStatus, (ViRsrc, ViBoolean, ViBoolean, Ptr{ViSession}), logicalName, IDQuery, resetDevice, vi)
end

function IviFgen_close(vi)
    ccall((:IviFgen_close, libnifgen), ViStatus, (ViSession,), vi)
end

function IviFgen_reset(vi)
    ccall((:IviFgen_reset, libnifgen), ViStatus, (ViSession,), vi)
end

function IviFgen_self_test(vi, selfTestResult, selfTestMessage)
    ccall((:IviFgen_self_test, libnifgen), ViStatus, (ViSession, Ptr{ViInt16}, Ptr{ViChar}), vi, selfTestResult, selfTestMessage)
end

function IviFgen_error_query(vi, errorCode, errorMessage)
    ccall((:IviFgen_error_query, libnifgen), ViStatus, (ViSession, Ptr{ViInt32}, Ptr{ViChar}), vi, errorCode, errorMessage)
end

function IviFgen_error_message(vi, statusCode, message)
    ccall((:IviFgen_error_message, libnifgen), ViStatus, (ViSession, ViStatus, Ptr{ViChar}), vi, statusCode, message)
end

function IviFgen_revision_query(vi, driverRev, instrRev)
    ccall((:IviFgen_revision_query, libnifgen), ViStatus, (ViSession, Ptr{ViChar}, Ptr{ViChar}), vi, driverRev, instrRev)
end

function IviFgen_InvalidateAllAttributes(vi)
    ccall((:IviFgen_InvalidateAllAttributes, libnifgen), ViStatus, (ViSession,), vi)
end

function IviFgen_ResetWithDefaults(vi)
    ccall((:IviFgen_ResetWithDefaults, libnifgen), ViStatus, (ViSession,), vi)
end

function IviFgen_Disable(vi)
    ccall((:IviFgen_Disable, libnifgen), ViStatus, (ViSession,), vi)
end

function IviFgen_InitWithOptions(logicalName, IDQuery, resetDevice, optionString, vi)
    ccall((:IviFgen_InitWithOptions, libnifgen), ViStatus, (ViRsrc, ViBoolean, ViBoolean, ViConstString, Ptr{ViSession}), logicalName, IDQuery, resetDevice, optionString, vi)
end

function IviFgen_GetAttributeViInt32(vi, channelName, attributeId, value)
    ccall((:IviFgen_GetAttributeViInt32, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViInt32}), vi, channelName, attributeId, value)
end

function IviFgen_SetAttributeViInt32(vi, channelName, attributeId, value)
    ccall((:IviFgen_SetAttributeViInt32, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32), vi, channelName, attributeId, value)
end

function IviFgen_CheckAttributeViInt32(vi, channelName, attributeId, value)
    ccall((:IviFgen_CheckAttributeViInt32, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32), vi, channelName, attributeId, value)
end

function IviFgen_GetAttributeViInt64(vi, channelName, attributeId, value)
    ccall((:IviFgen_GetAttributeViInt64, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViInt64}), vi, channelName, attributeId, value)
end

function IviFgen_SetAttributeViInt64(vi, channelName, attributeId, value)
    ccall((:IviFgen_SetAttributeViInt64, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViInt64), vi, channelName, attributeId, value)
end

function IviFgen_CheckAttributeViInt64(vi, channelName, attributeId, value)
    ccall((:IviFgen_CheckAttributeViInt64, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViInt64), vi, channelName, attributeId, value)
end

function IviFgen_GetAttributeViReal64(vi, channelName, attributeId, value)
    ccall((:IviFgen_GetAttributeViReal64, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViReal64}), vi, channelName, attributeId, value)
end

function IviFgen_SetAttributeViReal64(vi, channelName, attributeId, value)
    ccall((:IviFgen_SetAttributeViReal64, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViReal64), vi, channelName, attributeId, value)
end

function IviFgen_CheckAttributeViReal64(vi, channelName, attributeId, value)
    ccall((:IviFgen_CheckAttributeViReal64, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViReal64), vi, channelName, attributeId, value)
end

function IviFgen_GetAttributeViString(vi, channelName, attributeId, bufferSize, value)
    ccall((:IviFgen_GetAttributeViString, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, Ptr{ViChar}), vi, channelName, attributeId, bufferSize, value)
end

function IviFgen_SetAttributeViString(vi, channelName, attributeId, value)
    ccall((:IviFgen_SetAttributeViString, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViConstString), vi, channelName, attributeId, value)
end

function IviFgen_CheckAttributeViString(vi, channelName, attributeId, value)
    ccall((:IviFgen_CheckAttributeViString, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViConstString), vi, channelName, attributeId, value)
end

function IviFgen_GetAttributeViBoolean(vi, channelName, attributeId, value)
    ccall((:IviFgen_GetAttributeViBoolean, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViBoolean}), vi, channelName, attributeId, value)
end

function IviFgen_SetAttributeViBoolean(vi, channelName, attributeId, value)
    ccall((:IviFgen_SetAttributeViBoolean, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViBoolean), vi, channelName, attributeId, value)
end

function IviFgen_CheckAttributeViBoolean(vi, channelName, attributeId, value)
    ccall((:IviFgen_CheckAttributeViBoolean, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViBoolean), vi, channelName, attributeId, value)
end

function IviFgen_GetAttributeViSession(vi, channelName, attributeId, value)
    ccall((:IviFgen_GetAttributeViSession, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViSession}), vi, channelName, attributeId, value)
end

function IviFgen_SetAttributeViSession(vi, channelName, attributeId, value)
    ccall((:IviFgen_SetAttributeViSession, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViSession), vi, channelName, attributeId, value)
end

function IviFgen_CheckAttributeViSession(vi, channelName, attributeId, value)
    ccall((:IviFgen_CheckAttributeViSession, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViSession), vi, channelName, attributeId, value)
end

function IviFgen_LockSession(vi, callerHasLock)
    ccall((:IviFgen_LockSession, libnifgen), ViStatus, (ViSession, Ptr{ViBoolean}), vi, callerHasLock)
end

function IviFgen_UnlockSession(vi, callerHasLock)
    ccall((:IviFgen_UnlockSession, libnifgen), ViStatus, (ViSession, Ptr{ViBoolean}), vi, callerHasLock)
end

function IviFgen_GetError(vi, errorCode, bufferSize, description)
    ccall((:IviFgen_GetError, libnifgen), ViStatus, (ViSession, Ptr{ViStatus}, ViInt32, Ptr{ViChar}), vi, errorCode, bufferSize, description)
end

function IviFgen_ClearError(vi)
    ccall((:IviFgen_ClearError, libnifgen), ViStatus, (ViSession,), vi)
end

function IviFgen_GetNextInterchangeWarning(vi, bufferSize, warning)
    ccall((:IviFgen_GetNextInterchangeWarning, libnifgen), ViStatus, (ViSession, ViInt32, Ptr{ViChar}), vi, bufferSize, warning)
end

function IviFgen_ClearInterchangeWarnings(vi)
    ccall((:IviFgen_ClearInterchangeWarnings, libnifgen), ViStatus, (ViSession,), vi)
end

function IviFgen_ResetInterchangeCheck(vi)
    ccall((:IviFgen_ResetInterchangeCheck, libnifgen), ViStatus, (ViSession,), vi)
end

function IviFgen_GetNextCoercionRecord(vi, bufferSize, record)
    ccall((:IviFgen_GetNextCoercionRecord, libnifgen), ViStatus, (ViSession, ViInt32, Ptr{ViChar}), vi, bufferSize, record)
end

function IviFgen_GetSpecificDriverCHandle(vi, specificDriverCHandle)
    ccall((:IviFgen_GetSpecificDriverCHandle, libnifgen), ViStatus, (ViSession, Ptr{ViSession}), vi, specificDriverCHandle)
end

function IviFgen_GetSpecificDriverIUnknownPtr(vi, specificDriverIUnknownPtr)
    ccall((:IviFgen_GetSpecificDriverIUnknownPtr, libnifgen), ViStatus, (ViSession, Ptr{Cvoid}), vi, specificDriverIUnknownPtr)
end

function IviFgen_ConfigureOutputMode(vi, outputMode)
    ccall((:IviFgen_ConfigureOutputMode, libnifgen), ViStatus, (ViSession, ViInt32), vi, outputMode)
end

function IviFgen_ConfigureOperationMode(vi, channelName, operationMode)
    ccall((:IviFgen_ConfigureOperationMode, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32), vi, channelName, operationMode)
end

function IviFgen_ConfigureRefClockSource(vi, refClockSource)
    ccall((:IviFgen_ConfigureRefClockSource, libnifgen), ViStatus, (ViSession, ViInt32), vi, refClockSource)
end

function IviFgen_ConfigureOutputImpedance(vi, channelName, outputImpedance)
    ccall((:IviFgen_ConfigureOutputImpedance, libnifgen), ViStatus, (ViSession, ViConstString, ViReal64), vi, channelName, outputImpedance)
end

function IviFgen_ConfigureOutputEnabled(vi, channelName, enabled)
    ccall((:IviFgen_ConfigureOutputEnabled, libnifgen), ViStatus, (ViSession, ViConstString, ViBoolean), vi, channelName, enabled)
end

function IviFgen_GetChannelName(vi, index, bufferSize, name)
    ccall((:IviFgen_GetChannelName, libnifgen), ViStatus, (ViSession, ViInt32, ViInt32, Ptr{ViChar}), vi, index, bufferSize, name)
end

function IviFgen_InitiateGeneration(vi)
    ccall((:IviFgen_InitiateGeneration, libnifgen), ViStatus, (ViSession,), vi)
end

function IviFgen_AbortGeneration(vi)
    ccall((:IviFgen_AbortGeneration, libnifgen), ViStatus, (ViSession,), vi)
end

function IviFgen_ConfigureStandardWaveform(vi, channelName, waveform, amplitude, dcOffset, frequency, startPhase)
    ccall((:IviFgen_ConfigureStandardWaveform, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, ViReal64, ViReal64, ViReal64, ViReal64), vi, channelName, waveform, amplitude, dcOffset, frequency, startPhase)
end

function IviFgen_QueryArbWfmCapabilities(vi, maxNumWfms, wfmQuantum, minWfmSize, maxWfmSize)
    ccall((:IviFgen_QueryArbWfmCapabilities, libnifgen), ViStatus, (ViSession, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}), vi, maxNumWfms, wfmQuantum, minWfmSize, maxWfmSize)
end

function IviFgen_CreateArbWaveform(vi, wfmSize, wfmData, wfmHandle)
    ccall((:IviFgen_CreateArbWaveform, libnifgen), ViStatus, (ViSession, ViInt32, Ptr{ViReal64}, Ptr{ViInt32}), vi, wfmSize, wfmData, wfmHandle)
end

function IviFgen_ConfigureSampleRate(vi, sampleRate)
    ccall((:IviFgen_ConfigureSampleRate, libnifgen), ViStatus, (ViSession, ViReal64), vi, sampleRate)
end

function IviFgen_ConfigureArbWaveform(vi, channelName, wfmHandle, arbGain, arbOffset)
    ccall((:IviFgen_ConfigureArbWaveform, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, ViReal64, ViReal64), vi, channelName, wfmHandle, arbGain, arbOffset)
end

function IviFgen_ClearArbWaveform(vi, wfmHandle)
    ccall((:IviFgen_ClearArbWaveform, libnifgen), ViStatus, (ViSession, ViInt32), vi, wfmHandle)
end

function IviFgen_ConfigureArbFrequency(vi, channelName, frequency)
    ccall((:IviFgen_ConfigureArbFrequency, libnifgen), ViStatus, (ViSession, ViConstString, ViReal64), vi, channelName, frequency)
end

function IviFgen_QueryArbSeqCapabilities(vi, maxNumSeqs, minSeqLength, maxSeqLength, maxLoopCount)
    ccall((:IviFgen_QueryArbSeqCapabilities, libnifgen), ViStatus, (ViSession, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}), vi, maxNumSeqs, minSeqLength, maxSeqLength, maxLoopCount)
end

function IviFgen_CreateArbSequence(vi, seqLength, wfmHandle, wfmLoopCount, seqHandle)
    ccall((:IviFgen_CreateArbSequence, libnifgen), ViStatus, (ViSession, ViInt32, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}), vi, seqLength, wfmHandle, wfmLoopCount, seqHandle)
end

function IviFgen_ConfigureArbSequence(vi, channelName, seqHandle, arbGain, arbOffset)
    ccall((:IviFgen_ConfigureArbSequence, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, ViReal64, ViReal64), vi, channelName, seqHandle, arbGain, arbOffset)
end

function IviFgen_ClearArbSequence(vi, seqHandle)
    ccall((:IviFgen_ClearArbSequence, libnifgen), ViStatus, (ViSession, ViInt32), vi, seqHandle)
end

function IviFgen_ClearArbMemory(vi)
    ccall((:IviFgen_ClearArbMemory, libnifgen), ViStatus, (ViSession,), vi)
end

function IviFgen_ConfigureTriggerSource(vi, channelName, trigSource)
    ccall((:IviFgen_ConfigureTriggerSource, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32), vi, channelName, trigSource)
end

function IviFgen_ConfigureStartTrigger(vi, channelName, source, slope)
    ccall((:IviFgen_ConfigureStartTrigger, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString, ViInt32), vi, channelName, source, slope)
end

function IviFgen_ConfigureStopTrigger(vi, channelName, source, slope)
    ccall((:IviFgen_ConfigureStopTrigger, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString, ViInt32), vi, channelName, source, slope)
end

function IviFgen_SendSoftwareStopTrigger(vi)
    ccall((:IviFgen_SendSoftwareStopTrigger, libnifgen), ViStatus, (ViSession,), vi)
end

function IviFgen_ConfigureHoldTrigger(vi, channelName, source, slope)
    ccall((:IviFgen_ConfigureHoldTrigger, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString, ViInt32), vi, channelName, source, slope)
end

function IviFgen_SendSoftwareHoldTrigger(vi)
    ccall((:IviFgen_SendSoftwareHoldTrigger, libnifgen), ViStatus, (ViSession,), vi)
end

function IviFgen_ConfigureResumeTrigger(vi, channelName, source, slope)
    ccall((:IviFgen_ConfigureResumeTrigger, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString, ViInt32), vi, channelName, source, slope)
end

function IviFgen_SendSoftwareResumeTrigger(vi)
    ccall((:IviFgen_SendSoftwareResumeTrigger, libnifgen), ViStatus, (ViSession,), vi)
end

function IviFgen_ConfigureAdvanceTrigger(vi, channelName, source, slope)
    ccall((:IviFgen_ConfigureAdvanceTrigger, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString, ViInt32), vi, channelName, source, slope)
end

function IviFgen_SendSoftwareAdvanceTrigger(vi)
    ccall((:IviFgen_SendSoftwareAdvanceTrigger, libnifgen), ViStatus, (ViSession,), vi)
end

function IviFgen_ConfigureInternalTriggerRate(vi, rate)
    ccall((:IviFgen_ConfigureInternalTriggerRate, libnifgen), ViStatus, (ViSession, ViReal64), vi, rate)
end

function IviFgen_SendSoftwareTrigger(vi)
    ccall((:IviFgen_SendSoftwareTrigger, libnifgen), ViStatus, (ViSession,), vi)
end

function IviFgen_ConfigureBurstCount(vi, channelName, count)
    ccall((:IviFgen_ConfigureBurstCount, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32), vi, channelName, count)
end

function IviFgen_ConfigureAMEnabled(vi, channelName, enabled)
    ccall((:IviFgen_ConfigureAMEnabled, libnifgen), ViStatus, (ViSession, ViConstString, ViBoolean), vi, channelName, enabled)
end

function IviFgen_ConfigureAMSource(vi, channelName, source)
    ccall((:IviFgen_ConfigureAMSource, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32), vi, channelName, source)
end

function IviFgen_ConfigureAMInternal(vi, amdepth, amWaveform, amFrequency)
    ccall((:IviFgen_ConfigureAMInternal, libnifgen), ViStatus, (ViSession, ViReal64, ViInt32, ViReal64), vi, amdepth, amWaveform, amFrequency)
end

function IviFgen_ConfigureFMEnabled(vi, channelName, enabled)
    ccall((:IviFgen_ConfigureFMEnabled, libnifgen), ViStatus, (ViSession, ViConstString, ViBoolean), vi, channelName, enabled)
end

function IviFgen_ConfigureFMSource(vi, channelName, source)
    ccall((:IviFgen_ConfigureFMSource, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32), vi, channelName, source)
end

function IviFgen_ConfigureFMInternal(vi, fmdeviation, fmWaveform, fmFrequency)
    ccall((:IviFgen_ConfigureFMInternal, libnifgen), ViStatus, (ViSession, ViReal64, ViInt32, ViReal64), vi, fmdeviation, fmWaveform, fmFrequency)
end

function IviFgen_ConfigureSampleClock(vi, source)
    ccall((:IviFgen_ConfigureSampleClock, libnifgen), ViStatus, (ViSession, ViInt32), vi, source)
end

function IviFgen_ConfigureSampleClockOutputEnabled(vi, enabled)
    ccall((:IviFgen_ConfigureSampleClockOutputEnabled, libnifgen), ViStatus, (ViSession, ViBoolean), vi, enabled)
end

function IviFgen_QueryArbWfmCapabilities64(vi, maxNumWfms, wfmQuantum, minWfmSize, maxWfmSize)
    ccall((:IviFgen_QueryArbWfmCapabilities64, libnifgen), ViStatus, (ViSession, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt64}, Ptr{ViInt64}), vi, maxNumWfms, wfmQuantum, minWfmSize, maxWfmSize)
end

function IviFgen_CreateChannelArbWaveform(vi, channelName, wfmSize, wfmData, wfmHandle)
    ccall((:IviFgen_CreateChannelArbWaveform, libnifgen), ViStatus, (ViSession, ViConstString, ViInt64, Ptr{ViReal64}, Ptr{ViInt32}), vi, channelName, wfmSize, wfmData, wfmHandle)
end

function IviFgen_CreateChannelArbWaveform16(vi, channelName, wfmSize, wfmData, wfmHandle)
    ccall((:IviFgen_CreateChannelArbWaveform16, libnifgen), ViStatus, (ViSession, ViConstString, ViInt64, Ptr{ViInt16}, Ptr{ViInt32}), vi, channelName, wfmSize, wfmData, wfmHandle)
end

function IviFgen_CreateChannelArbWaveform32(vi, channelName, wfmSize, wfmData, wfmHandle)
    ccall((:IviFgen_CreateChannelArbWaveform32, libnifgen), ViStatus, (ViSession, ViConstString, ViInt64, Ptr{ViInt32}, Ptr{ViInt32}), vi, channelName, wfmSize, wfmData, wfmHandle)
end

function IviFgen_ConfigureDataMarker(vi, name, sourceChannel, bitPosition, destination)
    ccall((:IviFgen_ConfigureDataMarker, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString, ViInt32, ViConstString), vi, name, sourceChannel, bitPosition, destination)
end

function IviFgen_GetDataMarkerName(vi, index, nameBufferSize, name)
    ccall((:IviFgen_GetDataMarkerName, libnifgen), ViStatus, (ViSession, ViInt32, ViInt32, Ptr{ViChar}), vi, index, nameBufferSize, name)
end

function IviFgen_DisableAllDataMarkers(vi)
    ccall((:IviFgen_DisableAllDataMarkers, libnifgen), ViStatus, (ViSession,), vi)
end

function IviFgen_ConfigureSparseMarker(vi, name, wfmHandle, numIndexes, indexes, destination)
    ccall((:IviFgen_ConfigureSparseMarker, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, ViInt64, Ptr{ViInt64}, ViConstString), vi, name, wfmHandle, numIndexes, indexes, destination)
end

function IviFgen_GetSparseMarkerName(vi, index, nameBufferSize, name)
    ccall((:IviFgen_GetSparseMarkerName, libnifgen), ViStatus, (ViSession, ViInt32, ViInt32, Ptr{ViChar}), vi, index, nameBufferSize, name)
end

function IviFgen_GetSparseMarkerIndexes(vi, name, indexesArraySize, indexes, indexesActualSize)
    ccall((:IviFgen_GetSparseMarkerIndexes, libnifgen), ViStatus, (ViSession, ViConstString, ViInt64, Ptr{ViInt64}, Ptr{ViInt64}), vi, name, indexesArraySize, indexes, indexesActualSize)
end

function IviFgen_SetSparseMarkerIndexes(vi, name, indexesArraySize, indexes)
    ccall((:IviFgen_SetSparseMarkerIndexes, libnifgen), ViStatus, (ViSession, ViConstString, ViInt64, Ptr{ViInt64}), vi, name, indexesArraySize, indexes)
end

function IviFgen_DisableAllSparseMarkers(vi)
    ccall((:IviFgen_DisableAllSparseMarkers, libnifgen), ViStatus, (ViSession,), vi)
end
