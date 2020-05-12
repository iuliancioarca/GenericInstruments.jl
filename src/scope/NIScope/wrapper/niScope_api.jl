# Julia wrapper for header: niScope.h
# Automatically generated using Clang.jl


function niScope_init(resourceName, idQuery, resetDevice, vi)
    ccall((:niScope_init, libniscope), ViStatus, (ViRsrc, ViBoolean, ViBoolean, Ptr{ViSession}), resourceName, idQuery, resetDevice, vi)
end

function niScope_InitWithOptions(resourceName, idQuery, resetDevice, optionString, vi)
    ccall((:niScope_InitWithOptions, libniscope), ViStatus, (ViRsrc, ViBoolean, ViBoolean, ViConstString, Ptr{ViSession}), resourceName, idQuery, resetDevice, optionString, vi)
end

function niScope_close(vi)
    ccall((:niScope_close, libniscope), ViStatus, (ViSession,), vi)
end

function niScope_AutoSetup(vi)
    ccall((:niScope_AutoSetup, libniscope), ViStatus, (ViSession,), vi)
end

function niScope_ConfigureVertical(vi, channelList, vrange, offset, coupling, probeAttenuation, enabled)
    ccall((:niScope_ConfigureVertical, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViReal64, ViInt32, ViReal64, ViBoolean), vi, channelList, vrange, offset, coupling, probeAttenuation, enabled)
end

function niScope_ConfigureChanCharacteristics(vi, channelList, inputImpedance, maxInputFrequency)
    ccall((:niScope_ConfigureChanCharacteristics, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViReal64), vi, channelList, inputImpedance, maxInputFrequency)
end

function niScope_ConfigureHorizontalTiming(vi, minSampleRate, minNumPts, refPosition, numRecords, enforceRealtime)
    ccall((:niScope_ConfigureHorizontalTiming, libniscope), ViStatus, (ViSession, ViReal64, ViInt32, ViReal64, ViInt32, ViBoolean), vi, minSampleRate, minNumPts, refPosition, numRecords, enforceRealtime)
end

function niScope_ConfigureClock(vi, inputClockSource, outputClockSource, clockSyncPulseSource, masterEnabled)
    ccall((:niScope_ConfigureClock, libniscope), ViStatus, (ViSession, ViConstString, ViConstString, ViConstString, ViBoolean), vi, inputClockSource, outputClockSource, clockSyncPulseSource, masterEnabled)
end

function niScope_ExportSignal(vi, signal, signalIdentifier, outputTerminal)
    ccall((:niScope_ExportSignal, libniscope), ViStatus, (ViSession, ViInt32, ViConstString, ViConstString), vi, signal, signalIdentifier, outputTerminal)
end

function niScope_AdjustSampleClockRelativeDelay(vi, delay)
    ccall((:niScope_AdjustSampleClockRelativeDelay, libniscope), ViStatus, (ViSession, ViReal64), vi, delay)
end

function niScope_ConfigureTriggerEdge(vi, triggerSource, level, slope, triggerCoupling, holdoff, delay)
    ccall((:niScope_ConfigureTriggerEdge, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViInt32, ViInt32, ViReal64, ViReal64), vi, triggerSource, level, slope, triggerCoupling, holdoff, delay)
end

function niScope_ConfigureTriggerGlitch(vi, triggerSource, level, width, polarity, glitchCondition, triggerCoupling, holdoff, delay)
    ccall((:niScope_ConfigureTriggerGlitch, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViReal64, ViInt32, ViInt32, ViInt32, ViReal64, ViReal64), vi, triggerSource, level, width, polarity, glitchCondition, triggerCoupling, holdoff, delay)
end

function niScope_ConfigureTriggerHysteresis(vi, triggerSource, level, hysteresis, slope, triggerCoupling, holdoff, delay)
    ccall((:niScope_ConfigureTriggerHysteresis, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViReal64, ViInt32, ViInt32, ViReal64, ViReal64), vi, triggerSource, level, hysteresis, slope, triggerCoupling, holdoff, delay)
end

function niScope_ConfigureTriggerWindow(vi, triggerSource, lowLevel, highLevel, windowMode, triggerCoupling, holdoff, delay)
    ccall((:niScope_ConfigureTriggerWindow, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViReal64, ViInt32, ViInt32, ViReal64, ViReal64), vi, triggerSource, lowLevel, highLevel, windowMode, triggerCoupling, holdoff, delay)
end

function niScope_ConfigureTriggerSoftware(vi, holdoff, delay)
    ccall((:niScope_ConfigureTriggerSoftware, libniscope), ViStatus, (ViSession, ViReal64, ViReal64), vi, holdoff, delay)
end

function niScope_SendSoftwareTriggerEdge(vi, whichTrigger)
    ccall((:niScope_SendSoftwareTriggerEdge, libniscope), ViStatus, (ViSession, ViInt32), vi, whichTrigger)
end

function niScope_ConfigureTriggerImmediate(vi)
    ccall((:niScope_ConfigureTriggerImmediate, libniscope), ViStatus, (ViSession,), vi)
end

function niScope_ConfigureTriggerRunt(vi, triggerSource, lowThreshold, highThreshold, polarity, triggerCoupling, holdoff, delay)
    ccall((:niScope_ConfigureTriggerRunt, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViReal64, ViInt32, ViInt32, ViReal64, ViReal64), vi, triggerSource, lowThreshold, highThreshold, polarity, triggerCoupling, holdoff, delay)
end

function niScope_ConfigureTriggerDigital(vi, triggerSource, slope, holdoff, delay)
    ccall((:niScope_ConfigureTriggerDigital, libniscope), ViStatus, (ViSession, ViConstString, ViInt32, ViReal64, ViReal64), vi, triggerSource, slope, holdoff, delay)
end

function niScope_ConfigureTriggerVideo(vi, triggerSource, enableDcRestore, signalFormat, event, lineNumber, polarity, triggerCoupling, holdoff, delay)
    ccall((:niScope_ConfigureTriggerVideo, libniscope), ViStatus, (ViSession, ViConstString, ViBoolean, ViInt32, ViInt32, ViInt32, ViInt32, ViInt32, ViReal64, ViReal64), vi, triggerSource, enableDcRestore, signalFormat, event, lineNumber, polarity, triggerCoupling, holdoff, delay)
end

function niScope_ConfigureTriggerWidth(vi, triggerSource, level, lowThreshold, highThreshold, polarity, condition, triggerCoupling, holdoff, delay)
    ccall((:niScope_ConfigureTriggerWidth, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViReal64, ViReal64, ViInt32, ViInt32, ViInt32, ViReal64, ViReal64), vi, triggerSource, level, lowThreshold, highThreshold, polarity, condition, triggerCoupling, holdoff, delay)
end

function niScope_ConfigureEqualizationFilterCoefficients(vi, channelList, numberOfCoefficients, coefficients)
    ccall((:niScope_ConfigureEqualizationFilterCoefficients, libniscope), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViReal64}), vi, channelList, numberOfCoefficients, coefficients)
end

function niScope_GetEqualizationFilterCoefficients(vi, channel, numberOfCoefficients, coefficients)
    ccall((:niScope_GetEqualizationFilterCoefficients, libniscope), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViReal64}), vi, channel, numberOfCoefficients, coefficients)
end

function niScope_GetFrequencyResponse(vi, channel, bufferSize, frequencies, amplitudes, phases, numberOfFrequencies)
    ccall((:niScope_GetFrequencyResponse, libniscope), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViInt32}), vi, channel, bufferSize, frequencies, amplitudes, phases, numberOfFrequencies)
end

function niScope_ConfigureAcquisition(vi, acquisitionType)
    ccall((:niScope_ConfigureAcquisition, libniscope), ViStatus, (ViSession, ViInt32), vi, acquisitionType)
end

function niScope_InitiateAcquisition(vi)
    ccall((:niScope_InitiateAcquisition, libniscope), ViStatus, (ViSession,), vi)
end

function niScope_Abort(vi)
    ccall((:niScope_Abort, libniscope), ViStatus, (ViSession,), vi)
end

function niScope_Commit(vi)
    ccall((:niScope_Commit, libniscope), ViStatus, (ViSession,), vi)
end

function niScope_Read(vi, channelList, timeout, numSamples, waveform, wfmInfo)
    ccall((:niScope_Read, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViInt32, Ptr{ViReal64}, Ptr{niScope_wfmInfo}), vi, channelList, timeout, numSamples, waveform, wfmInfo)
end

function niScope_Fetch(vi, channelList, timeout, numSamples, waveform, wfmInfo)
    ccall((:niScope_Fetch, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViInt32, Ptr{ViReal64}, Ptr{niScope_wfmInfo}), vi, channelList, timeout, numSamples, waveform, wfmInfo)
end

function niScope_FetchBinary8(vi, channelList, timeout, numSamples, waveform, wfmInfo)
    ccall((:niScope_FetchBinary8, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViInt32, Ptr{ViInt8}, Ptr{niScope_wfmInfo}), vi, channelList, timeout, numSamples, waveform, wfmInfo)
end

function niScope_FetchBinary16(vi, channelList, timeout, numSamples, waveform, wfmInfo)
    ccall((:niScope_FetchBinary16, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViInt32, Ptr{ViInt16}, Ptr{niScope_wfmInfo}), vi, channelList, timeout, numSamples, waveform, wfmInfo)
end

function niScope_FetchBinary32(vi, channelList, timeout, numSamples, waveform, wfmInfo)
    ccall((:niScope_FetchBinary32, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViInt32, Ptr{ViInt32}, Ptr{niScope_wfmInfo}), vi, channelList, timeout, numSamples, waveform, wfmInfo)
end

function niScope_FetchComplex(vi, channelList, timeout, numSamples, wfm, wfmInfo)
    ccall((:niScope_FetchComplex, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViInt32, Ptr{NIComplexNumber}, Ptr{niScope_wfmInfo}), vi, channelList, timeout, numSamples, wfm, wfmInfo)
end

function niScope_FetchComplexBinary16(vi, channelList, timeout, numSamples, wfm, wfmInfo)
    ccall((:niScope_FetchComplexBinary16, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViInt32, Ptr{NIComplexI16}, Ptr{niScope_wfmInfo}), vi, channelList, timeout, numSamples, wfm, wfmInfo)
end

function niScope_AcquisitionStatus(vi, acquisitionStatus)
    ccall((:niScope_AcquisitionStatus, libniscope), ViStatus, (ViSession, Ptr{ViInt32}), vi, acquisitionStatus)
end

function niScope_ActualNumWfms(vi, channelList, numWfms)
    ccall((:niScope_ActualNumWfms, libniscope), ViStatus, (ViSession, ViConstString, Ptr{ViInt32}), vi, channelList, numWfms)
end

function niScope_ActualMeasWfmSize(vi, arrayMeasFunction, measWaveformSize)
    ccall((:niScope_ActualMeasWfmSize, libniscope), ViStatus, (ViSession, ViInt32, Ptr{ViInt32}), vi, arrayMeasFunction, measWaveformSize)
end

function niScope_ActualRecordLength(vi, recordLength)
    ccall((:niScope_ActualRecordLength, libniscope), ViStatus, (ViSession, Ptr{ViInt32}), vi, recordLength)
end

function niScope_SampleRate(vi, sampleRate)
    ccall((:niScope_SampleRate, libniscope), ViStatus, (ViSession, Ptr{ViReal64}), vi, sampleRate)
end

function niScope_SampleMode(vi, sampleMode)
    ccall((:niScope_SampleMode, libniscope), ViStatus, (ViSession, Ptr{ViInt32}), vi, sampleMode)
end

function niScope_AddWaveformProcessing(vi, channelList, measFunction)
    ccall((:niScope_AddWaveformProcessing, libniscope), ViStatus, (ViSession, ViConstString, ViInt32), vi, channelList, measFunction)
end

function niScope_ClearWaveformProcessing(vi, channelList)
    ccall((:niScope_ClearWaveformProcessing, libniscope), ViStatus, (ViSession, ViConstString), vi, channelList)
end

function niScope_ClearWaveformMeasurementStats(vi, channelList, clearableMeasurementFunction)
    ccall((:niScope_ClearWaveformMeasurementStats, libniscope), ViStatus, (ViSession, ViConstString, ViInt32), vi, channelList, clearableMeasurementFunction)
end

function niScope_ReadMeasurement(vi, channelList, timeout, scalarMeasFunction, result)
    ccall((:niScope_ReadMeasurement, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViInt32, Ptr{ViReal64}), vi, channelList, timeout, scalarMeasFunction, result)
end

function niScope_FetchMeasurement(vi, channelList, timeout, scalarMeasFunction, result)
    ccall((:niScope_FetchMeasurement, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViInt32, Ptr{ViReal64}), vi, channelList, timeout, scalarMeasFunction, result)
end

function niScope_FetchMeasurementStats(vi, channelList, timeout, scalarMeasFunction, result, mean, stdev, minval, maxval, numInStats)
    ccall((:niScope_FetchMeasurementStats, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViInt32, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViReal64}, Ptr{ViInt32}), vi, channelList, timeout, scalarMeasFunction, result, mean, stdev, minval, maxval, numInStats)
end

function niScope_FetchArrayMeasurement(vi, channelList, timeout, arrayMeasFunction, measWfmSize, measWfm, wfmInfo)
    ccall((:niScope_FetchArrayMeasurement, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViInt32, ViInt32, Ptr{ViReal64}, Ptr{niScope_wfmInfo}), vi, channelList, timeout, arrayMeasFunction, measWfmSize, measWfm, wfmInfo)
end

function niScope_reset(vi)
    ccall((:niScope_reset, libniscope), ViStatus, (ViSession,), vi)
end

function niScope_self_test(vi, selfTestResult, selfTestMessage)
    ccall((:niScope_self_test, libniscope), ViStatus, (ViSession, Ptr{ViInt16}, Ptr{ViChar}), vi, selfTestResult, selfTestMessage)
end

function niScope_Disable(vi)
    ccall((:niScope_Disable, libniscope), ViStatus, (ViSession,), vi)
end

function niScope_ResetDevice(vi)
    ccall((:niScope_ResetDevice, libniscope), ViStatus, (ViSession,), vi)
end

function niScope_CalSelfCalibrate(vi, channelList, option)
    ccall((:niScope_CalSelfCalibrate, libniscope), ViStatus, (ViSession, ViConstString, ViInt32), vi, channelList, option)
end

function niScope_revision_query(vi, driverRevision, firmwareRevision)
    ccall((:niScope_revision_query, libniscope), ViStatus, (ViSession, Ptr{ViChar}, Ptr{ViChar}), vi, driverRevision, firmwareRevision)
end

function niScope_ProbeCompensationSignalStart(vi)
    ccall((:niScope_ProbeCompensationSignalStart, libniscope), ViStatus, (ViSession,), vi)
end

function niScope_ProbeCompensationSignalStop(vi)
    ccall((:niScope_ProbeCompensationSignalStop, libniscope), ViStatus, (ViSession,), vi)
end

function niScope_CableSenseSignalStart(vi)
    ccall((:niScope_CableSenseSignalStart, libniscope), ViStatus, (ViSession,), vi)
end

function niScope_CableSenseSignalStop(vi)
    ccall((:niScope_CableSenseSignalStop, libniscope), ViStatus, (ViSession,), vi)
end

function niScope_IsDeviceReady(resourceName, channelList, deviceReady)
    ccall((:niScope_IsDeviceReady, libniscope), ViStatus, (ViRsrc, ViConstString, Ptr{ViBoolean}), resourceName, channelList, deviceReady)
end

function niScope_GetChannelName(vi, index, bufferSize, channelString)
    ccall((:niScope_GetChannelName, libniscope), ViStatus, (ViSession, ViInt32, ViInt32, Ptr{ViChar}), vi, index, bufferSize, channelString)
end

function niScope_GetChannelNameFromString(vi, index, bufferSize, name)
    ccall((:niScope_GetChannelNameFromString, libniscope), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViChar}), vi, index, bufferSize, name)
end

function niScope_errorHandler(vi, errorCode, errorSource, errorDescription)
    ccall((:niScope_errorHandler, libniscope), ViStatus, (ViSession, ViStatus, Ptr{ViChar}, Ptr{ViChar}), vi, errorCode, errorSource, errorDescription)
end

function niScope_GetError(vi, errorCode, bufferSize, description)
    ccall((:niScope_GetError, libniscope), ViStatus, (ViSession, Ptr{ViStatus}, ViInt32, Ptr{ViChar}), vi, errorCode, bufferSize, description)
end

function niScope_GetErrorMessage(vi, errorCode, bufferSize, errorMessage)
    ccall((:niScope_GetErrorMessage, libniscope), ViStatus, (ViSession, ViStatus, ViInt32, Ptr{ViChar}), vi, errorCode, bufferSize, errorMessage)
end

function niScope_LockSession(vi, callerHasLock)
    ccall((:niScope_LockSession, libniscope), ViStatus, (ViSession, Ptr{ViBoolean}), vi, callerHasLock)
end

function niScope_UnlockSession(vi, callerHasLock)
    ccall((:niScope_UnlockSession, libniscope), ViStatus, (ViSession, Ptr{ViBoolean}), vi, callerHasLock)
end

function niScope_GetAttributeViInt32(vi, channelList, attributeId, value)
    ccall((:niScope_GetAttributeViInt32, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViInt32}), vi, channelList, attributeId, value)
end

function niScope_SetAttributeViInt32(vi, channelList, attributeId, value)
    ccall((:niScope_SetAttributeViInt32, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32), vi, channelList, attributeId, value)
end

function niScope_CheckAttributeViInt32(vi, channelList, attributeId, value)
    ccall((:niScope_CheckAttributeViInt32, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32), vi, channelList, attributeId, value)
end

function niScope_GetAttributeViInt64(vi, channelList, attributeId, value)
    ccall((:niScope_GetAttributeViInt64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViInt64}), vi, channelList, attributeId, value)
end

function niScope_SetAttributeViInt64(vi, channelList, attributeId, value)
    ccall((:niScope_SetAttributeViInt64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt64), vi, channelList, attributeId, value)
end

function niScope_CheckAttributeViInt64(vi, channelList, attributeId, value)
    ccall((:niScope_CheckAttributeViInt64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt64), vi, channelList, attributeId, value)
end

function niScope_GetAttributeViReal64(vi, channelList, attributeId, value)
    ccall((:niScope_GetAttributeViReal64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViReal64}), vi, channelList, attributeId, value)
end

function niScope_SetAttributeViReal64(vi, channelList, attributeId, value)
    ccall((:niScope_SetAttributeViReal64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViReal64), vi, channelList, attributeId, value)
end

function niScope_CheckAttributeViReal64(vi, channelList, attributeId, value)
    ccall((:niScope_CheckAttributeViReal64, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViReal64), vi, channelList, attributeId, value)
end

function niScope_GetAttributeViString(vi, channelList, attributeId, bufSize, value)
    ccall((:niScope_GetAttributeViString, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, Ptr{ViChar}), vi, channelList, attributeId, bufSize, value)
end

function niScope_SetAttributeViString(vi, channelList, attributeId, value)
    ccall((:niScope_SetAttributeViString, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViConstString), vi, channelList, attributeId, value)
end

function niScope_CheckAttributeViString(vi, channelList, attributeId, value)
    ccall((:niScope_CheckAttributeViString, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViConstString), vi, channelList, attributeId, value)
end

function niScope_GetAttributeViSession(vi, channelList, attributeId, value)
    ccall((:niScope_GetAttributeViSession, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViSession}), vi, channelList, attributeId, value)
end

function niScope_SetAttributeViSession(vi, channelList, attributeId, value)
    ccall((:niScope_SetAttributeViSession, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViSession), vi, channelList, attributeId, value)
end

function niScope_CheckAttributeViSession(vi, channelList, attributeId, value)
    ccall((:niScope_CheckAttributeViSession, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViSession), vi, channelList, attributeId, value)
end

function niScope_GetAttributeViBoolean(vi, channelList, attributeId, value)
    ccall((:niScope_GetAttributeViBoolean, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViBoolean}), vi, channelList, attributeId, value)
end

function niScope_SetAttributeViBoolean(vi, channelList, attributeId, value)
    ccall((:niScope_SetAttributeViBoolean, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViBoolean), vi, channelList, attributeId, value)
end

function niScope_CheckAttributeViBoolean(vi, channelList, attributeId, value)
    ccall((:niScope_CheckAttributeViBoolean, libniscope), ViStatus, (ViSession, ViConstString, ViAttr, ViBoolean), vi, channelList, attributeId, value)
end

function niScope_ResetAttribute(vi, channelList, attributeId)
    ccall((:niScope_ResetAttribute, libniscope), ViStatus, (ViSession, ViConstString, ViAttr), vi, channelList, attributeId)
end

function niScope_ResetAllAttributes(vi)
    ccall((:niScope_ResetAllAttributes, libniscope), ViStatus, (ViSession,), vi)
end

function niScope_ImportAttributeConfigurationBuffer(vi, sizeInBytes, configuration)
    ccall((:niScope_ImportAttributeConfigurationBuffer, libniscope), ViStatus, (ViSession, ViInt32, Ptr{ViInt8}), vi, sizeInBytes, configuration)
end

function niScope_ExportAttributeConfigurationBuffer(vi, sizeInBytes, configuration)
    ccall((:niScope_ExportAttributeConfigurationBuffer, libniscope), ViStatus, (ViSession, ViInt32, Ptr{ViInt8}), vi, sizeInBytes, configuration)
end

function niScope_ImportAttributeConfigurationFile(vi, filePath)
    ccall((:niScope_ImportAttributeConfigurationFile, libniscope), ViStatus, (ViSession, ViConstString), vi, filePath)
end

function niScope_ExportAttributeConfigurationFile(vi, filePath)
    ccall((:niScope_ExportAttributeConfigurationFile, libniscope), ViStatus, (ViSession, ViConstString), vi, filePath)
end

function niScope_GetScalingCoefficients(vi, channelList, bufferSize, coefficientInfo, numberOfCoefficientSets)
    ccall((:niScope_GetScalingCoefficients, libniscope), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{niScope_coefficientInfo}, Ptr{ViInt32}), vi, channelList, bufferSize, coefficientInfo, numberOfCoefficientSets)
end

function niScope_GetNormalizationCoefficients(vi, channelList, bufferSize, coefficientInfo, numberOfCoefficientSets)
    ccall((:niScope_GetNormalizationCoefficients, libniscope), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{niScope_coefficientInfo}, Ptr{ViInt32}), vi, channelList, bufferSize, coefficientInfo, numberOfCoefficientSets)
end

function niScope_GetStreamEndpointHandle(vi, streamName, writerHandle)
    ccall((:niScope_GetStreamEndpointHandle, libniscope), ViStatus, (ViSession, ViConstString, Ptr{ViUInt32}), vi, streamName, writerHandle)
end