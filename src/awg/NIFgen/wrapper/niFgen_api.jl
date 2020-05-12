# Julia wrapper for header: niFgen.h
# Automatically generated using Clang.jl


function niFgen_init(resourceName, IDQuery, resetDevice, vi)
    ccall((:niFgen_init, libnifgen), ViStatus, (ViRsrc, ViBoolean, ViBoolean, Ptr{ViSession}), resourceName, IDQuery, resetDevice, vi)
end

function niFgen_InitWithOptions(resourceName, IDQuery, resetDevice, optionString, newVi)
    ccall((:niFgen_InitWithOptions, libnifgen), ViStatus, (ViRsrc, ViBoolean, ViBoolean, ViConstString, Ptr{ViSession}), resourceName, IDQuery, resetDevice, optionString, newVi)
end

function niFgen_InitializeWithChannels(resourceName, channelName, resetDevice, optionString, newVi)
    ccall((:niFgen_InitializeWithChannels, libnifgen), ViStatus, (ViRsrc, ViConstString, ViBoolean, ViConstString, Ptr{ViSession}), resourceName, channelName, resetDevice, optionString, newVi)
end

function niFgen_close(vi)
    ccall((:niFgen_close, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_reset(vi)
    ccall((:niFgen_reset, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_self_test(vi, testResult, testMessage)
    ccall((:niFgen_self_test, libnifgen), ViStatus, (ViSession, Ptr{ViInt16}, Ptr{ViChar}), vi, testResult, testMessage)
end

function niFgen_error_query(vi, errorCode, selfTestMessage)
    ccall((:niFgen_error_query, libnifgen), ViStatus, (ViSession, Ptr{ViInt32}, Ptr{ViChar}), vi, errorCode, selfTestMessage)
end

function niFgen_error_message(vi, statusCode, message)
    ccall((:niFgen_error_message, libnifgen), ViStatus, (ViSession, ViStatus, Ptr{ViChar}), vi, statusCode, message)
end

function niFgen_revision_query(vi, driverRev, instrRev)
    ccall((:niFgen_revision_query, libnifgen), ViStatus, (ViSession, Ptr{ViChar}, Ptr{ViChar}), vi, driverRev, instrRev)
end

function niFgen_GetError(vi, errorCode, errorDescriptionBufferSize, errorDescription)
    ccall((:niFgen_GetError, libnifgen), ViStatus, (ViSession, Ptr{ViStatus}, ViInt32, Ptr{ViChar}), vi, errorCode, errorDescriptionBufferSize, errorDescription)
end

function niFgen_ClearError(vi)
    ccall((:niFgen_ClearError, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_ErrorHandler(vi, statusCode, errorMessage)
    ccall((:niFgen_ErrorHandler, libnifgen), ViStatus, (ViSession, ViStatus, Ptr{ViChar}), vi, statusCode, errorMessage)
end

function niFgen_LockSession(vi, callerHasLock)
    ccall((:niFgen_LockSession, libnifgen), ViStatus, (ViSession, Ptr{ViBoolean}), vi, callerHasLock)
end

function niFgen_UnlockSession(vi, callerHasLock)
    ccall((:niFgen_UnlockSession, libnifgen), ViStatus, (ViSession, Ptr{ViBoolean}), vi, callerHasLock)
end

function niFgen_GetChannelName(vi, index, bufferSize, name)
    ccall((:niFgen_GetChannelName, libnifgen), ViStatus, (ViSession, ViInt32, ViInt32, Ptr{ViChar}), vi, index, bufferSize, name)
end

function niFgen_GetNextInterchangeWarning(vi, bufferSize, warnString)
    ccall((:niFgen_GetNextInterchangeWarning, libnifgen), ViStatus, (ViSession, ViInt32, Ptr{ViChar}), vi, bufferSize, warnString)
end

function niFgen_ResetInterchangeCheck(vi)
    ccall((:niFgen_ResetInterchangeCheck, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_ClearInterchangeWarnings(vi)
    ccall((:niFgen_ClearInterchangeWarnings, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_GetNextCoercionRecord(vi, bufferSize, record)
    ccall((:niFgen_GetNextCoercionRecord, libnifgen), ViStatus, (ViSession, ViInt32, Ptr{ViChar}), vi, bufferSize, record)
end

function niFgen_InvalidateAllAttributes(vi)
    ccall((:niFgen_InvalidateAllAttributes, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_ResetWithDefaults(vi)
    ccall((:niFgen_ResetWithDefaults, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_Disable(vi)
    ccall((:niFgen_Disable, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_Commit(vi)
    ccall((:niFgen_Commit, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_GetHardwareState(vi, state)
    ccall((:niFgen_GetHardwareState, libnifgen), ViStatus, (ViSession, Ptr{ViInt32}), vi, state)
end

function niFgen_WaitUntilDone(vi, maxTime)
    ccall((:niFgen_WaitUntilDone, libnifgen), ViStatus, (ViSession, ViInt32), vi, maxTime)
end

function niFgen_IsDone(vi, done)
    ccall((:niFgen_IsDone, libnifgen), ViStatus, (ViSession, Ptr{ViBoolean}), vi, done)
end

function niFgen_ResetDevice(vi)
    ccall((:niFgen_ResetDevice, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_ConfigureOperationMode(vi, channelName, mode)
    ccall((:niFgen_ConfigureOperationMode, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32), vi, channelName, mode)
end

function niFgen_ConfigureOutputMode(vi, outputMode)
    ccall((:niFgen_ConfigureOutputMode, libnifgen), ViStatus, (ViSession, ViInt32), vi, outputMode)
end

function niFgen_ConfigureReferenceClock(vi, referenceClockSource, referenceClockFrequency)
    ccall((:niFgen_ConfigureReferenceClock, libnifgen), ViStatus, (ViSession, ViConstString, ViReal64), vi, referenceClockSource, referenceClockFrequency)
end

function niFgen_ConfigureOutputImpedance(vi, channelName, outputImpedance)
    ccall((:niFgen_ConfigureOutputImpedance, libnifgen), ViStatus, (ViSession, ViConstString, ViReal64), vi, channelName, outputImpedance)
end

function niFgen_ConfigureOutputEnabled(vi, channelName, enabled)
    ccall((:niFgen_ConfigureOutputEnabled, libnifgen), ViStatus, (ViSession, ViConstString, ViBoolean), vi, channelName, enabled)
end

function niFgen_ConfigureChannels(vi, channelName)
    ccall((:niFgen_ConfigureChannels, libnifgen), ViStatus, (ViSession, ViConstString), vi, channelName)
end

function niFgen_InitiateGeneration(vi)
    ccall((:niFgen_InitiateGeneration, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_AbortGeneration(vi)
    ccall((:niFgen_AbortGeneration, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_ConfigureStandardWaveform(vi, channelName, waveform, amplitude, dcOffset, frequency, startPhase)
    ccall((:niFgen_ConfigureStandardWaveform, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, ViReal64, ViReal64, ViReal64, ViReal64), vi, channelName, waveform, amplitude, dcOffset, frequency, startPhase)
end

function niFgen_DefineUserStandardWaveform(vi, channelName, numberOfSamples, data)
    ccall((:niFgen_DefineUserStandardWaveform, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViReal64}), vi, channelName, numberOfSamples, data)
end

function niFgen_ClearUserStandardWaveform(vi, channelName)
    ccall((:niFgen_ClearUserStandardWaveform, libnifgen), ViStatus, (ViSession, ViConstString), vi, channelName)
end

function niFgen_ConfigureFrequency(vi, channelName, Frequency)
    ccall((:niFgen_ConfigureFrequency, libnifgen), ViStatus, (ViSession, ViConstString, ViReal64), vi, channelName, Frequency)
end

function niFgen_ConfigureAmplitude(vi, channelName, Amplitude)
    ccall((:niFgen_ConfigureAmplitude, libnifgen), ViStatus, (ViSession, ViConstString, ViReal64), vi, channelName, Amplitude)
end

function niFgen_QueryArbWfmCapabilities(vi, maxNumWfms, wfmQuantum, minNumberOfSamples, maxNumberOfSamples)
    ccall((:niFgen_QueryArbWfmCapabilities, libnifgen), ViStatus, (ViSession, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}), vi, maxNumWfms, wfmQuantum, minNumberOfSamples, maxNumberOfSamples)
end

function niFgen_CreateWaveformF64(vi, channelName, numberOfSamples, wfmData, wfmHandle)
    ccall((:niFgen_CreateWaveformF64, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViReal64}, Ptr{ViInt32}), vi, channelName, numberOfSamples, wfmData, wfmHandle)
end

function niFgen_CreateWaveformI16(vi, channelName, numberOfSamples, wfmData, wfmHandle)
    ccall((:niFgen_CreateWaveformI16, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViInt16}, Ptr{ViInt32}), vi, channelName, numberOfSamples, wfmData, wfmHandle)
end

function niFgen_CreateWaveformComplexF64(vi, channelName, numberOfSamples, wfmData, wfmHandle)
    ccall((:niFgen_CreateWaveformComplexF64, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{NIComplexNumber}, Ptr{ViInt32}), vi, channelName, numberOfSamples, wfmData, wfmHandle)
end

function niFgen_CreateWaveformFromFileI16(vi, channelName, fileName, byteOrder, wfmHandle)
    ccall((:niFgen_CreateWaveformFromFileI16, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString, ViInt32, Ptr{ViInt32}), vi, channelName, fileName, byteOrder, wfmHandle)
end

function niFgen_CreateWaveformFromFileF64(vi, channelName, fileName, byteOrder, wfmHandle)
    ccall((:niFgen_CreateWaveformFromFileF64, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString, ViInt32, Ptr{ViInt32}), vi, channelName, fileName, byteOrder, wfmHandle)
end

function niFgen_CreateWaveformFromFileHWS(vi, channelName, fileName, useRateFromWaveform, useGainAndOffsetFromWaveform, wfmHandle)
    ccall((:niFgen_CreateWaveformFromFileHWS, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString, ViBoolean, ViBoolean, Ptr{ViInt32}), vi, channelName, fileName, useRateFromWaveform, useGainAndOffsetFromWaveform, wfmHandle)
end

function niFgen_ConfigureSampleRate(vi, sampleRate)
    ccall((:niFgen_ConfigureSampleRate, libnifgen), ViStatus, (ViSession, ViReal64), vi, sampleRate)
end

function niFgen_ConfigureArbWaveform(vi, channelName, wfmHandle, arbGain, arbOffset)
    ccall((:niFgen_ConfigureArbWaveform, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, ViReal64, ViReal64), vi, channelName, wfmHandle, arbGain, arbOffset)
end

function niFgen_ClearArbWaveform(vi, wfmHandle)
    ccall((:niFgen_ClearArbWaveform, libnifgen), ViStatus, (ViSession, ViInt32), vi, wfmHandle)
end

function niFgen_AllocateNamedWaveform(vi, channelName, wfmName, numberOfSamples)
    ccall((:niFgen_AllocateNamedWaveform, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString, ViInt32), vi, channelName, wfmName, numberOfSamples)
end

function niFgen_SetNamedWaveformNextWritePosition(vi, channelName, wfmName, relativeTo, offset)
    ccall((:niFgen_SetNamedWaveformNextWritePosition, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString, ViInt32, ViInt32), vi, channelName, wfmName, relativeTo, offset)
end

function niFgen_WriteNamedWaveformF64(vi, channelName, wfmName, numberOfSamples, wfmData)
    ccall((:niFgen_WriteNamedWaveformF64, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString, ViInt32, Ptr{ViReal64}), vi, channelName, wfmName, numberOfSamples, wfmData)
end

function niFgen_WriteNamedWaveformI16(vi, channelName, wfmName, numberOfSamples, wfmData)
    ccall((:niFgen_WriteNamedWaveformI16, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString, ViInt32, Ptr{ViInt16}), vi, channelName, wfmName, numberOfSamples, wfmData)
end

function niFgen_WriteNamedWaveformComplexF64(vi, channelName, wfmName, numberOfSamples, wfmData)
    ccall((:niFgen_WriteNamedWaveformComplexF64, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString, ViInt32, Ptr{NIComplexNumber}), vi, channelName, wfmName, numberOfSamples, wfmData)
end

function niFgen_WriteNamedWaveformComplexI16(vi, channelName, wfmName, numberOfSamples, wfmData)
    ccall((:niFgen_WriteNamedWaveformComplexI16, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString, ViInt32, Ptr{NIComplexI16}), vi, channelName, wfmName, numberOfSamples, wfmData)
end

function niFgen_DeleteNamedWaveform(vi, channelName, wfmName)
    ccall((:niFgen_DeleteNamedWaveform, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString), vi, channelName, wfmName)
end

function niFgen_QueryArbSeqCapabilities(vi, maxNumSeqs, minSeqLength, maxSeqLength, maxLoopCount)
    ccall((:niFgen_QueryArbSeqCapabilities, libnifgen), ViStatus, (ViSession, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}), vi, maxNumSeqs, minSeqLength, maxSeqLength, maxLoopCount)
end

function niFgen_CreateArbSequence(vi, seqLength, wfmHandle, wfmLoopCount, seqHandle)
    ccall((:niFgen_CreateArbSequence, libnifgen), ViStatus, (ViSession, ViInt32, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}), vi, seqLength, wfmHandle, wfmLoopCount, seqHandle)
end

function niFgen_CreateAdvancedArbSequence(vi, seqLength, wfmHandles, loopCounts, sampleCounts, markers, coercedMarkers, seqHandle)
    ccall((:niFgen_CreateAdvancedArbSequence, libnifgen), ViStatus, (ViSession, ViInt32, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}), vi, seqLength, wfmHandles, loopCounts, sampleCounts, markers, coercedMarkers, seqHandle)
end

function niFgen_ConfigureArbSequence(vi, channelName, seqHandle, arbGain, arbOffset)
    ccall((:niFgen_ConfigureArbSequence, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, ViReal64, ViReal64), vi, channelName, seqHandle, arbGain, arbOffset)
end

function niFgen_ClearArbSequence(vi, seqHandle)
    ccall((:niFgen_ClearArbSequence, libnifgen), ViStatus, (ViSession, ViInt32), vi, seqHandle)
end

function niFgen_ClearArbMemory(vi)
    ccall((:niFgen_ClearArbMemory, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_QueryFreqListCapabilities(vi, maximumNumberOfFreqLists, minimumFrequencyListLength, maximumFrequencyListLength, minimumFrequencyListDuration, maximumFrequencyListDuration, frequencyListDurationQuantum)
    ccall((:niFgen_QueryFreqListCapabilities, libnifgen), ViStatus, (ViSession, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViReal64}), vi, maximumNumberOfFreqLists, minimumFrequencyListLength, maximumFrequencyListLength, minimumFrequencyListDuration, maximumFrequencyListDuration, frequencyListDurationQuantum)
end

function niFgen_CreateFreqList(vi, waveform, frequencyListLength, frequencyArray, durationArray, frequencyListHandle)
    ccall((:niFgen_CreateFreqList, libnifgen), ViStatus, (ViSession, ViInt32, ViInt32, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViInt32}), vi, waveform, frequencyListLength, frequencyArray, durationArray, frequencyListHandle)
end

function niFgen_ConfigureFreqList(vi, channelName, frequencyListHandle, amplitude, dcOffset, startPhase)
    ccall((:niFgen_ConfigureFreqList, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, ViReal64, ViReal64, ViReal64), vi, channelName, frequencyListHandle, amplitude, dcOffset, startPhase)
end

function niFgen_ClearFreqList(vi, frequencyListHandle)
    ccall((:niFgen_ClearFreqList, libnifgen), ViStatus, (ViSession, ViInt32), vi, frequencyListHandle)
end

function niFgen_WriteScript(vi, channelName, script)
    ccall((:niFgen_WriteScript, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString), vi, channelName, script)
end

function niFgen_DeleteScript(vi, channelName, scriptName)
    ccall((:niFgen_DeleteScript, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString), vi, channelName, scriptName)
end

function niFgen_ExportSignal(vi, signal, signalIdentifier, outputTerminal)
    ccall((:niFgen_ExportSignal, libnifgen), ViStatus, (ViSession, ViInt32, ViConstString, ViConstString), vi, signal, signalIdentifier, outputTerminal)
end

function niFgen_RouteSignalOut(vi, channelName, from, to)
    ccall((:niFgen_RouteSignalOut, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, ViInt32), vi, channelName, from, to)
end

function niFgen_SendSoftwareEdgeTrigger(vi, triggerName, triggerIdentifier)
    ccall((:niFgen_SendSoftwareEdgeTrigger, libnifgen), ViStatus, (ViSession, ViInt32, ViConstString), vi, triggerName, triggerIdentifier)
end

function niFgen_ConfigureDigitalEdgeStartTrigger(vi, source, edge)
    ccall((:niFgen_ConfigureDigitalEdgeStartTrigger, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32), vi, source, edge)
end

function niFgen_ConfigureSoftwareEdgeStartTrigger(vi)
    ccall((:niFgen_ConfigureSoftwareEdgeStartTrigger, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_DisableStartTrigger(vi)
    ccall((:niFgen_DisableStartTrigger, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_ConfigureP2PEndpointFullnessStartTrigger(vi, p2pEndpointFullnessLevel)
    ccall((:niFgen_ConfigureP2PEndpointFullnessStartTrigger, libnifgen), ViStatus, (ViSession, ViInt32), vi, p2pEndpointFullnessLevel)
end

function niFgen_ConfigureDigitalEdgeScriptTrigger(vi, triggerID, source, edge)
    ccall((:niFgen_ConfigureDigitalEdgeScriptTrigger, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString, ViInt32), vi, triggerID, source, edge)
end

function niFgen_ConfigureDigitalLevelScriptTrigger(vi, triggerID, source, level)
    ccall((:niFgen_ConfigureDigitalLevelScriptTrigger, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString, ViInt32), vi, triggerID, source, level)
end

function niFgen_ConfigureSoftwareEdgeScriptTrigger(vi, triggerID)
    ccall((:niFgen_ConfigureSoftwareEdgeScriptTrigger, libnifgen), ViStatus, (ViSession, ViConstString), vi, triggerID)
end

function niFgen_DisableScriptTrigger(vi, triggerID)
    ccall((:niFgen_DisableScriptTrigger, libnifgen), ViStatus, (ViSession, ViConstString), vi, triggerID)
end

function niFgen_ConfigureClockMode(vi, clockMode)
    ccall((:niFgen_ConfigureClockMode, libnifgen), ViStatus, (ViSession, ViInt32), vi, clockMode)
end

function niFgen_AdjustSampleClockRelativeDelay(vi, tm)
    ccall((:niFgen_AdjustSampleClockRelativeDelay, libnifgen), ViStatus, (ViSession, ViReal64), vi, tm)
end

function niFgen_AllocateWaveform(vi, channelName, numberOfSamples, waveformHandle)
    ccall((:niFgen_AllocateWaveform, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViInt32}), vi, channelName, numberOfSamples, waveformHandle)
end

function niFgen_SetWaveformNextWritePosition(vi, channelName, waveformHandle, relativeTo, offset)
    ccall((:niFgen_SetWaveformNextWritePosition, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, ViInt32, ViInt32), vi, channelName, waveformHandle, relativeTo, offset)
end

function niFgen_WriteWaveform(vi, channelName, waveformHandle, numberOfSamples, wfmData)
    ccall((:niFgen_WriteWaveform, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, ViInt32, Ptr{ViReal64}), vi, channelName, waveformHandle, numberOfSamples, wfmData)
end

function niFgen_WriteBinary16Waveform(vi, channelName, waveformHandle, numberOfSamples, wfmData)
    ccall((:niFgen_WriteBinary16Waveform, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, ViInt32, Ptr{ViInt16}), vi, channelName, waveformHandle, numberOfSamples, wfmData)
end

function niFgen_WriteWaveformComplexF64(vi, channelName, numberOfSamples, wfmData, wfmHandle)
    ccall((:niFgen_WriteWaveformComplexF64, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{NIComplexNumber}, ViInt32), vi, channelName, numberOfSamples, wfmData, wfmHandle)
end

function niFgen_WriteComplexBinary16Waveform(vi, channelName, waveformHandle, numberOfSamples, wfmData)
    ccall((:niFgen_WriteComplexBinary16Waveform, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, ViInt32, Ptr{NIComplexI16}), vi, channelName, waveformHandle, numberOfSamples, wfmData)
end

function niFgen_InitExtCal(resourceName, password, vi)
    ccall((:niFgen_InitExtCal, libnifgen), ViStatus, (ViRsrc, ViConstString, Ptr{ViSession}), resourceName, password, vi)
end

function niFgen_InitializeOscillatorFrequencyCalibration(vi)
    ccall((:niFgen_InitializeOscillatorFrequencyCalibration, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_InitializeAnalogOutputCalibration(vi)
    ccall((:niFgen_InitializeAnalogOutputCalibration, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_InitializeCalADCCalibration(vi)
    ccall((:niFgen_InitializeCalADCCalibration, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_InitializeFlatnessCalibration(vi)
    ccall((:niFgen_InitializeFlatnessCalibration, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_CloseExtCal(vi, action)
    ccall((:niFgen_CloseExtCal, libnifgen), ViStatus, (ViSession, ViInt32), vi, action)
end

function niFgen_SelfCal(vi)
    ccall((:niFgen_SelfCal, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_RestoreLastExtCalConstants(vi)
    ccall((:niFgen_RestoreLastExtCalConstants, libnifgen), ViStatus, (ViSession,), vi)
end

function niFgen_GetSelfCalSupported(vi, selfCalSupported)
    ccall((:niFgen_GetSelfCalSupported, libnifgen), ViStatus, (ViSession, Ptr{ViBoolean}), vi, selfCalSupported)
end

function niFgen_GetSelfCalLastDateAndTime(vi, year, month, day, hour, minute)
    ccall((:niFgen_GetSelfCalLastDateAndTime, libnifgen), ViStatus, (ViSession, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}), vi, year, month, day, hour, minute)
end

function niFgen_GetExtCalLastDateAndTime(vi, year, month, day, hour, minute)
    ccall((:niFgen_GetExtCalLastDateAndTime, libnifgen), ViStatus, (ViSession, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}), vi, year, month, day, hour, minute)
end

function niFgen_GetSelfCalLastTemp(vi, temp)
    ccall((:niFgen_GetSelfCalLastTemp, libnifgen), ViStatus, (ViSession, Ptr{ViReal64}), vi, temp)
end

function niFgen_GetExtCalLastTemp(vi, temp)
    ccall((:niFgen_GetExtCalLastTemp, libnifgen), ViStatus, (ViSession, Ptr{ViReal64}), vi, temp)
end

function niFgen_GetExtCalRecommendedInterval(vi, months)
    ccall((:niFgen_GetExtCalRecommendedInterval, libnifgen), ViStatus, (ViSession, Ptr{ViInt32}), vi, months)
end

function niFgen_ChangeExtCalPassword(vi, oldPassword, newPassword)
    ccall((:niFgen_ChangeExtCalPassword, libnifgen), ViStatus, (ViSession, ViConstString, ViConstString), vi, oldPassword, newPassword)
end

function niFgen_SetCalUserDefinedInfo(vi, info)
    ccall((:niFgen_SetCalUserDefinedInfo, libnifgen), ViStatus, (ViSession, ViConstString), vi, info)
end

function niFgen_GetCalUserDefinedInfo(vi, info)
    ccall((:niFgen_GetCalUserDefinedInfo, libnifgen), ViStatus, (ViSession, ViString), vi, info)
end

function niFgen_GetCalUserDefinedInfoMaxSize(vi, infoSize)
    ccall((:niFgen_GetCalUserDefinedInfoMaxSize, libnifgen), ViStatus, (ViSession, Ptr{ViInt32}), vi, infoSize)
end

function niFgen_ReadCurrentTemperature(vi, temperature)
    ccall((:niFgen_ReadCurrentTemperature, libnifgen), ViStatus, (ViSession, Ptr{ViReal64}), vi, temperature)
end

function niFgen_ReadCalADC(vi, numberOfReadsToAverage, returnCalibratedValue, calADCValue)
    ccall((:niFgen_ReadCalADC, libnifgen), ViStatus, (ViSession, ViInt32, ViBoolean, Ptr{ViReal64}), vi, numberOfReadsToAverage, returnCalibratedValue, calADCValue)
end

function niFgen_WriteBinary16AnalogStaticValue(vi, channelName, value)
    ccall((:niFgen_WriteBinary16AnalogStaticValue, libnifgen), ViStatus, (ViSession, ViConstString, ViInt16), vi, channelName, value)
end

function niFgen_CalAdjustMainPathPreAmpOffset(vi, channelName, configuration, gainDACValues, offsetDACValues, measuredOutputs)
    ccall((:niFgen_CalAdjustMainPathPreAmpOffset, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViReal64}), vi, channelName, configuration, gainDACValues, offsetDACValues, measuredOutputs)
end

function niFgen_CalAdjustMainPathPreAmpGain(vi, channelName, configuration, mainDACValues, gainDACValues, offsetDACValues, measuredOutputs)
    ccall((:niFgen_CalAdjustMainPathPreAmpGain, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViReal64}), vi, channelName, configuration, mainDACValues, gainDACValues, offsetDACValues, measuredOutputs)
end

function niFgen_CalAdjustMainPathPostAmpGainAndOffset(vi, channelName, configuration, mainDACValues, gainDACValues, offsetDACValues, measuredOutputs)
    ccall((:niFgen_CalAdjustMainPathPostAmpGainAndOffset, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViReal64}), vi, channelName, configuration, mainDACValues, gainDACValues, offsetDACValues, measuredOutputs)
end

function niFgen_CalAdjustDirectPathGain(vi, channelName, mainDACValues, gainDACValues, measuredOutputs)
    ccall((:niFgen_CalAdjustDirectPathGain, libnifgen), ViStatus, (ViSession, ViConstString, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViReal64}), vi, channelName, mainDACValues, gainDACValues, measuredOutputs)
end

function niFgen_CalAdjustMainPathOutputImpedance(vi, channelName, configuration, loadImpedance, measuredSourceVoltage, measuredVoltageAcrossLoad)
    ccall((:niFgen_CalAdjustMainPathOutputImpedance, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, ViReal64, ViReal64, ViReal64), vi, channelName, configuration, loadImpedance, measuredSourceVoltage, measuredVoltageAcrossLoad)
end

function niFgen_CalAdjustDirectPathOutputImpedance(vi, channelName, configuration, loadImpedance, measuredSourceVoltage, measuredVoltageAcrossLoad)
    ccall((:niFgen_CalAdjustDirectPathOutputImpedance, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, ViReal64, ViReal64, ViReal64), vi, channelName, configuration, loadImpedance, measuredSourceVoltage, measuredVoltageAcrossLoad)
end

function niFgen_CalAdjustOscillatorFrequency(vi, desiredFrequencyInHz, measuredFrequencyInHz)
    ccall((:niFgen_CalAdjustOscillatorFrequency, libnifgen), ViStatus, (ViSession, ViReal64, ViReal64), vi, desiredFrequencyInHz, measuredFrequencyInHz)
end

function niFgen_CalAdjustADC(vi, channelName, configuration, voltagesMeasuredExternally, voltagesMeasuredWithCalADC)
    ccall((:niFgen_CalAdjustADC, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViReal64}, Ptr{ViReal64}), vi, channelName, configuration, voltagesMeasuredExternally, voltagesMeasuredWithCalADC)
end

function niFgen_CalAdjustFlatness(vi, channelName, configuration, requestedAmplitude, frequencies, measuredAmplitudes, numberOfMeasurements)
    ccall((:niFgen_CalAdjustFlatness, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, ViReal64, Ptr{ViReal64}, Ptr{ViReal64}, ViInt32), vi, channelName, configuration, requestedAmplitude, frequencies, measuredAmplitudes, numberOfMeasurements)
end

function niFgen_ConfigureCustomFIRFilterCoefficients(vi, channelName, numberOfCoefficients, coefficients)
    ccall((:niFgen_ConfigureCustomFIRFilterCoefficients, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViReal64}), vi, channelName, numberOfCoefficients, coefficients)
end

function niFgen_GetFIRFilterCoefficients(vi, channelName, arraySize, coefficients, numberOfCoefficientsRead)
    ccall((:niFgen_GetFIRFilterCoefficients, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViReal64}, Ptr{ViInt32}), vi, channelName, arraySize, coefficients, numberOfCoefficientsRead)
end

function niFgen_GetStreamEndpointHandle(vi, streamEndpoint, readerHandle)
    ccall((:niFgen_GetStreamEndpointHandle, libnifgen), ViStatus, (ViSession, ViConstString, Ptr{ViUInt32}), vi, streamEndpoint, readerHandle)
end

function niFgen_ManualEnableP2PStream(vi, streamEndpoint)
    ccall((:niFgen_ManualEnableP2PStream, libnifgen), ViStatus, (ViSession, ViConstString), vi, streamEndpoint)
end

function niFgen_WriteP2PEndpointI16(vi, fifoEndpointName, numberOfSamples, endpointData)
    ccall((:niFgen_WriteP2PEndpointI16, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViInt16}), vi, fifoEndpointName, numberOfSamples, endpointData)
end

function niFgen_ConfigureSynchronization(vi, channelName, Synchronization)
    ccall((:niFgen_ConfigureSynchronization, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32), vi, channelName, Synchronization)
end

function niFgen_EnableDigitalPatterning(vi, channelName)
    ccall((:niFgen_EnableDigitalPatterning, libnifgen), ViStatus, (ViSession, ViConstString), vi, channelName)
end

function niFgen_DisableDigitalPatterning(vi, channelName)
    ccall((:niFgen_DisableDigitalPatterning, libnifgen), ViStatus, (ViSession, ViConstString), vi, channelName)
end

function niFgen_EnableDigitalFilter(vi, channelName)
    ccall((:niFgen_EnableDigitalFilter, libnifgen), ViStatus, (ViSession, ViConstString), vi, channelName)
end

function niFgen_DisableDigitalFilter(vi, channelName)
    ccall((:niFgen_DisableDigitalFilter, libnifgen), ViStatus, (ViSession, ViConstString), vi, channelName)
end

function niFgen_EnableAnalogFilter(vi, channelName, filterCorrectionFreq)
    ccall((:niFgen_EnableAnalogFilter, libnifgen), ViStatus, (ViSession, ViConstString, ViReal64), vi, channelName, filterCorrectionFreq)
end

function niFgen_DisableAnalogFilter(vi, channelName)
    ccall((:niFgen_DisableAnalogFilter, libnifgen), ViStatus, (ViSession, ViConstString), vi, channelName)
end

function niFgen_ConfigureSampleClockSource(vi, sampleClockSource)
    ccall((:niFgen_ConfigureSampleClockSource, libnifgen), ViStatus, (ViSession, ViConstString), vi, sampleClockSource)
end

function niFgen_ConfigureTriggerMode(vi, channelName, mode)
    ccall((:niFgen_ConfigureTriggerMode, libnifgen), ViStatus, (ViSession, ViConstString, ViInt32), vi, channelName, mode)
end

function niFgen_ImportAttributeConfigurationFile(vi, filePath)
    ccall((:niFgen_ImportAttributeConfigurationFile, libnifgen), ViStatus, (ViSession, ViConstString), vi, filePath)
end

function niFgen_ExportAttributeConfigurationFile(vi, filePath)
    ccall((:niFgen_ExportAttributeConfigurationFile, libnifgen), ViStatus, (ViSession, ViConstString), vi, filePath)
end

function niFgen_ImportAttributeConfigurationBuffer(vi, sz, configuration)
    ccall((:niFgen_ImportAttributeConfigurationBuffer, libnifgen), ViStatus, (ViSession, ViInt32, ViAddr), vi, sz, configuration)
end

function niFgen_ExportAttributeConfigurationBuffer(vi, sz, configuration)
    ccall((:niFgen_ExportAttributeConfigurationBuffer, libnifgen), ViStatus, (ViSession, ViInt32, ViAddr), vi, sz, configuration)
end

function niFgen_SetAttributeViInt64(vi, channelName, attributeId, value)
    ccall((:niFgen_SetAttributeViInt64, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViInt64), vi, channelName, attributeId, value)
end

function niFgen_CheckAttributeViInt64(vi, channelName, attributeId, value)
    ccall((:niFgen_CheckAttributeViInt64, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViInt64), vi, channelName, attributeId, value)
end

function niFgen_GetAttributeViInt64(vi, channelName, attributeId, value)
    ccall((:niFgen_GetAttributeViInt64, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViInt64}), vi, channelName, attributeId, value)
end

function niFgen_SetAttributeViInt32(vi, channelName, attributeId, value)
    ccall((:niFgen_SetAttributeViInt32, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32), vi, channelName, attributeId, value)
end

function niFgen_SetAttributeViReal64(vi, channelName, attributeId, value)
    ccall((:niFgen_SetAttributeViReal64, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViReal64), vi, channelName, attributeId, value)
end

function niFgen_SetAttributeViString(vi, channelName, attributeId, value)
    ccall((:niFgen_SetAttributeViString, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViConstString), vi, channelName, attributeId, value)
end

function niFgen_SetAttributeViBoolean(vi, channelName, attributeId, value)
    ccall((:niFgen_SetAttributeViBoolean, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViBoolean), vi, channelName, attributeId, value)
end

function niFgen_SetAttributeViSession(vi, channelName, attributeId, value)
    ccall((:niFgen_SetAttributeViSession, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViSession), vi, channelName, attributeId, value)
end

function niFgen_CheckAttributeViInt32(vi, channelName, attributeId, value)
    ccall((:niFgen_CheckAttributeViInt32, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32), vi, channelName, attributeId, value)
end

function niFgen_CheckAttributeViReal64(vi, channelName, attributeId, value)
    ccall((:niFgen_CheckAttributeViReal64, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViReal64), vi, channelName, attributeId, value)
end

function niFgen_CheckAttributeViString(vi, channelName, attributeId, value)
    ccall((:niFgen_CheckAttributeViString, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViConstString), vi, channelName, attributeId, value)
end

function niFgen_CheckAttributeViBoolean(vi, channelName, attributeId, value)
    ccall((:niFgen_CheckAttributeViBoolean, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViBoolean), vi, channelName, attributeId, value)
end

function niFgen_CheckAttributeViSession(vi, channelName, attributeId, value)
    ccall((:niFgen_CheckAttributeViSession, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViSession), vi, channelName, attributeId, value)
end

function niFgen_GetAttributeViInt32(vi, channelName, attributeId, value)
    ccall((:niFgen_GetAttributeViInt32, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViInt32}), vi, channelName, attributeId, value)
end

function niFgen_GetAttributeViReal64(vi, channelName, attributeId, value)
    ccall((:niFgen_GetAttributeViReal64, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViReal64}), vi, channelName, attributeId, value)
end

function niFgen_GetAttributeViString(vi, channelName, attributeId, bufSize, value)
    ccall((:niFgen_GetAttributeViString, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, Ptr{ViChar}), vi, channelName, attributeId, bufSize, value)
end

function niFgen_GetAttributeViBoolean(vi, channelName, attributeId, value)
    ccall((:niFgen_GetAttributeViBoolean, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViBoolean}), vi, channelName, attributeId, value)
end

function niFgen_GetAttributeViSession(vi, channelName, attributeId, value)
    ccall((:niFgen_GetAttributeViSession, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViSession}), vi, channelName, attributeId, value)
end

function niFgen_ResetAttribute(vi, channelName, attributeId)
    ccall((:niFgen_ResetAttribute, libnifgen), ViStatus, (ViSession, ViConstString, ViAttr), vi, channelName, attributeId)
end
