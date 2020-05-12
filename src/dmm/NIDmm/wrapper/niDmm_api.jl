# Julia wrapper for header: nidmm.h
# Automatically generated using Clang.jl


function niDMM_init(resourceName, IDQuery, rst, newVi)
    ccall((:niDMM_init, libnidmm), ViStatus, (ViRsrc, ViBoolean, ViBoolean, Ptr{ViSession}), resourceName, IDQuery, rst, newVi)
end

function niDMM_InitWithOptions(resourceName, IDQuery, resetDevice, optionsString, newVi)
    ccall((:niDMM_InitWithOptions, libnidmm), ViStatus, (ViRsrc, ViBoolean, ViBoolean, ViString, Ptr{ViSession}), resourceName, IDQuery, resetDevice, optionsString, newVi)
end

function niDMM_close(vi)
    ccall((:niDMM_close, libnidmm), ViStatus, (ViSession,), vi)
end

function niDMM_GetError(vi, errorCode, bufferSize, description)
    ccall((:niDMM_GetError, libnidmm), ViStatus, (ViSession, Ptr{ViStatus}, ViInt32, Ptr{ViChar}), vi, errorCode, bufferSize, description)
end

function niDMM_GetErrorMessage(vi, errorCode, bufferSize, errMessage)
    ccall((:niDMM_GetErrorMessage, libnidmm), ViStatus, (ViSession, ViStatus, ViInt32, Ptr{ViChar}), vi, errorCode, bufferSize, errMessage)
end

function niDMM_ClearError(vi)
    ccall((:niDMM_ClearError, libnidmm), ViStatus, (ViSession,), vi)
end

function niDMM_reset(vi)
    ccall((:niDMM_reset, libnidmm), ViStatus, (ViSession,), vi)
end

function niDMM_self_test(vi, selfTestResult, selfTestMessage)
    ccall((:niDMM_self_test, libnidmm), ViStatus, (ViSession, Ptr{ViInt16}, Ptr{ViChar}), vi, selfTestResult, selfTestMessage)
end

function niDMM_SelfCal(vi)
    ccall((:niDMM_SelfCal, libnidmm), ViStatus, (ViSession,), vi)
end

function niDMM_revision_query(vi, driverRev, instrRev)
    ccall((:niDMM_revision_query, libnidmm), ViStatus, (ViSession, Ptr{ViChar}, Ptr{ViChar}), vi, driverRev, instrRev)
end

function niDMM_InvalidateAllAttributes(vi)
    ccall((:niDMM_InvalidateAllAttributes, libnidmm), ViStatus, (ViSession,), vi)
end

function niDMM_ResetWithDefaults(vi)
    ccall((:niDMM_ResetWithDefaults, libnidmm), ViStatus, (ViSession,), vi)
end

function niDMM_Disable(vi)
    ccall((:niDMM_Disable, libnidmm), ViStatus, (ViSession,), vi)
end

function niDMM_GetMeasurementPeriod(vi, period)
    ccall((:niDMM_GetMeasurementPeriod, libnidmm), ViStatus, (ViSession, Ptr{ViReal64}), vi, period)
end

function niDMM_ConfigureTrigger(vi, trigSource, triggerDelay)
    ccall((:niDMM_ConfigureTrigger, libnidmm), ViStatus, (ViSession, ViInt32, ViReal64), vi, trigSource, triggerDelay)
end

function niDMM_Read(vi, maxTime, reading)
    ccall((:niDMM_Read, libnidmm), ViStatus, (ViSession, ViInt32, Ptr{ViReal64}), vi, maxTime, reading)
end

function niDMM_Fetch(vi, maxTime, reading)
    ccall((:niDMM_Fetch, libnidmm), ViStatus, (ViSession, ViInt32, Ptr{ViReal64}), vi, maxTime, reading)
end

function niDMM_Abort(vi)
    ccall((:niDMM_Abort, libnidmm), ViStatus, (ViSession,), vi)
end

function niDMM_Initiate(vi)
    ccall((:niDMM_Initiate, libnidmm), ViStatus, (ViSession,), vi)
end

function niDMM_IsOverRange(vi, measurementValue, isOverRange)
    ccall((:niDMM_IsOverRange, libnidmm), ViStatus, (ViSession, ViReal64, Ptr{ViBoolean}), vi, measurementValue, isOverRange)
end

function niDMM_IsUnderRange(vi, measurementValue, isUnderRange)
    ccall((:niDMM_IsUnderRange, libnidmm), ViStatus, (ViSession, ViReal64, Ptr{ViBoolean}), vi, measurementValue, isUnderRange)
end

function niDMM_ConfigureACBandwidth(vi, minFreq, maxFreq)
    ccall((:niDMM_ConfigureACBandwidth, libnidmm), ViStatus, (ViSession, ViReal64, ViReal64), vi, minFreq, maxFreq)
end

function niDMM_ConfigureFrequencyVoltageRange(vi, frequencyVoltageRange)
    ccall((:niDMM_ConfigureFrequencyVoltageRange, libnidmm), ViStatus, (ViSession, ViReal64), vi, frequencyVoltageRange)
end

function niDMM_ConfigureMeasCompleteDest(vi, destination)
    ccall((:niDMM_ConfigureMeasCompleteDest, libnidmm), ViStatus, (ViSession, ViInt32), vi, destination)
end

function niDMM_ConfigureMultiPoint(vi, triggerCount, sampleCount, sampleTrigger, sampleInterval)
    ccall((:niDMM_ConfigureMultiPoint, libnidmm), ViStatus, (ViSession, ViInt32, ViInt32, ViInt32, ViReal64), vi, triggerCount, sampleCount, sampleTrigger, sampleInterval)
end

function niDMM_ReadMultiPoint(vi, maxTime, arraySize, readingArray, actualPts)
    ccall((:niDMM_ReadMultiPoint, libnidmm), ViStatus, (ViSession, ViInt32, ViInt32, Ptr{ViReal64}, Ptr{ViInt32}), vi, maxTime, arraySize, readingArray, actualPts)
end

function niDMM_FetchMultiPoint(vi, maxTime, arraySize, readingArray, actualPts)
    ccall((:niDMM_FetchMultiPoint, libnidmm), ViStatus, (ViSession, ViInt32, ViInt32, Ptr{ViReal64}, Ptr{ViInt32}), vi, maxTime, arraySize, readingArray, actualPts)
end

function niDMM_ConfigureTriggerSlope(vi, polarity)
    ccall((:niDMM_ConfigureTriggerSlope, libnidmm), ViStatus, (ViSession, ViInt32), vi, polarity)
end

function niDMM_SendSoftwareTrigger(vi)
    ccall((:niDMM_SendSoftwareTrigger, libnidmm), ViStatus, (ViSession,), vi)
end

function niDMM_GetApertureTimeInfo(vi, apertureTime, apertureTimeUnits)
    ccall((:niDMM_GetApertureTimeInfo, libnidmm), ViStatus, (ViSession, Ptr{ViReal64}, Ptr{ViInt32}), vi, apertureTime, apertureTimeUnits)
end

function niDMM_GetAutoRangeValue(vi, autoRangeValue)
    ccall((:niDMM_GetAutoRangeValue, libnidmm), ViStatus, (ViSession, Ptr{ViReal64}), vi, autoRangeValue)
end

function niDMM_ConfigureAutoZeroMode(vi, autoZeroMode)
    ccall((:niDMM_ConfigureAutoZeroMode, libnidmm), ViStatus, (ViSession, ViInt32), vi, autoZeroMode)
end

function niDMM_ConfigurePowerLineFrequency(vi, frequency)
    ccall((:niDMM_ConfigurePowerLineFrequency, libnidmm), ViStatus, (ViSession, ViReal64), vi, frequency)
end

function niDMM_ConfigureMeasurementDigits(vi, measFunction, vrange, resolutionDigits)
    ccall((:niDMM_ConfigureMeasurementDigits, libnidmm), ViStatus, (ViSession, ViInt32, ViReal64, ViReal64), vi, measFunction, vrange, resolutionDigits)
end

function niDMM_ConfigureMeasurementAbsolute(vi, measFunction, vrange, resolutionAbsolute)
    ccall((:niDMM_ConfigureMeasurementAbsolute, libnidmm), ViStatus, (ViSession, ViInt32, ViReal64, ViReal64), vi, measFunction, vrange, resolutionAbsolute)
end

function niDMM_ConfigureMeasCompleteSlope(vi, polarity)
    ccall((:niDMM_ConfigureMeasCompleteSlope, libnidmm), ViStatus, (ViSession, ViInt32), vi, polarity)
end

function niDMM_ConfigureSampleTriggerSlope(vi, polarity)
    ccall((:niDMM_ConfigureSampleTriggerSlope, libnidmm), ViStatus, (ViSession, ViInt32), vi, polarity)
end

function niDMM_ReadStatus(vi, acqBacklog, acqDone)
    ccall((:niDMM_ReadStatus, libnidmm), ViStatus, (ViSession, Ptr{ViInt32}, Ptr{ViInt16}), vi, acqBacklog, acqDone)
end

function niDMM_Control(vi, action)
    ccall((:niDMM_Control, libnidmm), ViStatus, (ViSession, ViInt32), vi, action)
end

function niDMM_ConfigureADCCalibration(vi, adcGainComp)
    ccall((:niDMM_ConfigureADCCalibration, libnidmm), ViStatus, (ViSession, ViInt32), vi, adcGainComp)
end

function niDMM_ConfigureOffsetCompOhms(vi, offsetCompOhms)
    ccall((:niDMM_ConfigureOffsetCompOhms, libnidmm), ViStatus, (ViSession, ViInt32), vi, offsetCompOhms)
end

function niDMM_ConfigureCurrentSource(vi, diodeCurrentSrc)
    ccall((:niDMM_ConfigureCurrentSource, libnidmm), ViStatus, (ViSession, ViReal64), vi, diodeCurrentSrc)
end

function niDMM_ConfigureCableCompType(vi, typeOfCompensation)
    ccall((:niDMM_ConfigureCableCompType, libnidmm), ViStatus, (ViSession, ViInt32), vi, typeOfCompensation)
end

function niDMM_PerformOpenCableComp(vi, conductance, susceptance)
    ccall((:niDMM_PerformOpenCableComp, libnidmm), ViStatus, (ViSession, Ptr{ViReal64}, Ptr{ViReal64}), vi, conductance, susceptance)
end

function niDMM_PerformShortCableComp(vi, resistance, reactance)
    ccall((:niDMM_PerformShortCableComp, libnidmm), ViStatus, (ViSession, Ptr{ViReal64}, Ptr{ViReal64}), vi, resistance, reactance)
end

function niDMM_ConfigureOpenCableCompValues(vi, conductance, susceptance)
    ccall((:niDMM_ConfigureOpenCableCompValues, libnidmm), ViStatus, (ViSession, ViReal64, ViReal64), vi, conductance, susceptance)
end

function niDMM_ConfigureShortCableCompValues(vi, resistance, reactance)
    ccall((:niDMM_ConfigureShortCableCompValues, libnidmm), ViStatus, (ViSession, ViReal64, ViReal64), vi, resistance, reactance)
end

function niDMM_LockSession(vi, callerHasLock)
    ccall((:niDMM_LockSession, libnidmm), ViStatus, (ViSession, Ptr{ViBoolean}), vi, callerHasLock)
end

function niDMM_UnlockSession(vi, callerHasLock)
    ccall((:niDMM_UnlockSession, libnidmm), ViStatus, (ViSession, Ptr{ViBoolean}), vi, callerHasLock)
end

function niDMM_ConfigureWaveformAcquisition(vi, _function, vrange, rate, waveformPoints)
    ccall((:niDMM_ConfigureWaveformAcquisition, libnidmm), ViStatus, (ViSession, ViInt32, ViReal64, ViReal64, ViInt32), vi, _function, vrange, rate, waveformPoints)
end

function niDMM_ConfigureWaveformCoupling(vi, coupling)
    ccall((:niDMM_ConfigureWaveformCoupling, libnidmm), ViStatus, (ViSession, ViInt32), vi, coupling)
end

function niDMM_FetchWaveform(vi, maxTime, arraySize, waveformArray, actualPoints)
    ccall((:niDMM_FetchWaveform, libnidmm), ViStatus, (ViSession, ViInt32, ViInt32, Ptr{ViReal64}, Ptr{ViInt32}), vi, maxTime, arraySize, waveformArray, actualPoints)
end

function niDMM_ReadWaveform(vi, maxTime, arraySize, waveformArray, actualPoints)
    ccall((:niDMM_ReadWaveform, libnidmm), ViStatus, (ViSession, ViInt32, ViInt32, Ptr{ViReal64}, Ptr{ViInt32}), vi, maxTime, arraySize, waveformArray, actualPoints)
end

function niDMM_GetAttributeViInt32(vi, channelName, attributeId, value)
    ccall((:niDMM_GetAttributeViInt32, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViInt32}), vi, channelName, attributeId, value)
end

function niDMM_SetAttributeViInt32(vi, channelName, attributeId, value)
    ccall((:niDMM_SetAttributeViInt32, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32), vi, channelName, attributeId, value)
end

function niDMM_CheckAttributeViInt32(vi, channelName, attributeId, value)
    ccall((:niDMM_CheckAttributeViInt32, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32), vi, channelName, attributeId, value)
end

function niDMM_GetAttributeViReal64(vi, channelName, attributeId, value)
    ccall((:niDMM_GetAttributeViReal64, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViReal64}), vi, channelName, attributeId, value)
end

function niDMM_SetAttributeViReal64(vi, channelName, attributeId, value)
    ccall((:niDMM_SetAttributeViReal64, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViReal64), vi, channelName, attributeId, value)
end

function niDMM_CheckAttributeViReal64(vi, channelName, attributeId, value)
    ccall((:niDMM_CheckAttributeViReal64, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViReal64), vi, channelName, attributeId, value)
end

function niDMM_GetAttributeViString(vi, channelName, attributeId, bufSize, value)
    ccall((:niDMM_GetAttributeViString, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViInt32, Ptr{ViChar}), vi, channelName, attributeId, bufSize, value)
end

function niDMM_SetAttributeViString(vi, channelName, attributeId, value)
    ccall((:niDMM_SetAttributeViString, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViChar}), vi, channelName, attributeId, value)
end

function niDMM_CheckAttributeViString(vi, channelName, attributeId, value)
    ccall((:niDMM_CheckAttributeViString, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViChar}), vi, channelName, attributeId, value)
end

function niDMM_GetAttributeViSession(vi, channelName, attributeId, value)
    ccall((:niDMM_GetAttributeViSession, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViSession}), vi, channelName, attributeId, value)
end

function niDMM_SetAttributeViSession(vi, channelName, attributeId, value)
    ccall((:niDMM_SetAttributeViSession, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViSession), vi, channelName, attributeId, value)
end

function niDMM_CheckAttributeViSession(vi, channelName, attributeId, value)
    ccall((:niDMM_CheckAttributeViSession, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViSession), vi, channelName, attributeId, value)
end

function niDMM_GetAttributeViBoolean(vi, channelName, attributeId, value)
    ccall((:niDMM_GetAttributeViBoolean, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, Ptr{ViBoolean}), vi, channelName, attributeId, value)
end

function niDMM_SetAttributeViBoolean(vi, channelName, attributeId, value)
    ccall((:niDMM_SetAttributeViBoolean, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViBoolean), vi, channelName, attributeId, value)
end

function niDMM_CheckAttributeViBoolean(vi, channelName, attributeId, value)
    ccall((:niDMM_CheckAttributeViBoolean, libnidmm), ViStatus, (ViSession, ViConstString, ViAttr, ViBoolean), vi, channelName, attributeId, value)
end

function niDMM_ImportAttributeConfigurationFile(vi, filePath)
    ccall((:niDMM_ImportAttributeConfigurationFile, libnidmm), ViStatus, (ViSession, ViConstString), vi, filePath)
end

function niDMM_ExportAttributeConfigurationFile(vi, filePath)
    ccall((:niDMM_ExportAttributeConfigurationFile, libnidmm), ViStatus, (ViSession, ViConstString), vi, filePath)
end

function niDMM_ImportAttributeConfigurationBuffer(vi, sz, configuration)
    ccall((:niDMM_ImportAttributeConfigurationBuffer, libnidmm), ViStatus, (ViSession, ViInt32, ViAddr), vi, sz, configuration)
end

function niDMM_ExportAttributeConfigurationBuffer(vi, sz, configuration)
    ccall((:niDMM_ExportAttributeConfigurationBuffer, libnidmm), ViStatus, (ViSession, ViInt32, ViAddr), vi, sz, configuration)
end

function niDMM_GetNextCoercionRecord(vi, bufferSize, record)
    ccall((:niDMM_GetNextCoercionRecord, libnidmm), ViStatus, (ViSession, ViInt32, Ptr{ViChar}), vi, bufferSize, record)
end

function niDMM_GetNextInterchangeWarning(vi, bufferSize, warnString)
    ccall((:niDMM_GetNextInterchangeWarning, libnidmm), ViStatus, (ViSession, ViInt32, Ptr{ViChar}), vi, bufferSize, warnString)
end

function niDMM_ResetInterchangeCheck(vi)
    ccall((:niDMM_ResetInterchangeCheck, libnidmm), ViStatus, (ViSession,), vi)
end

function niDMM_ClearInterchangeWarnings(vi)
    ccall((:niDMM_ClearInterchangeWarnings, libnidmm), ViStatus, (ViSession,), vi)
end

function niDMM_4022Control(resourceName, configuration)
    ccall((:niDMM_4022Control, libnidmm), ViStatus, (ViRsrc, ViInt32), resourceName, configuration)
end

function niDMM_GetChannelName(vi, index, bufferSize, name)
    ccall((:niDMM_GetChannelName, libnidmm), ViStatus, (ViSession, ViInt32, ViInt32, Ptr{ViChar}), vi, index, bufferSize, name)
end

function niDMM_InitExtCal(resourceName, password, newVi)
    ccall((:niDMM_InitExtCal, libnidmm), ViStatus, (ViRsrc, Ptr{ViChar}, Ptr{ViSession}), resourceName, password, newVi)
end

function niDMM_CloseExtCal(vi, action)
    ccall((:niDMM_CloseExtCal, libnidmm), ViStatus, (ViSession, ViInt32), vi, action)
end

function niDMM_CalAdjustLinearization(vi, mode, vrange, inputR, expectedValue)
    ccall((:niDMM_CalAdjustLinearization, libnidmm), ViStatus, (ViSession, ViInt32, ViReal64, ViReal64, ViReal64), vi, mode, vrange, inputR, expectedValue)
end

function niDMM_CalAdjustGain(vi, mode, vrange, inputR, expectedValue)
    ccall((:niDMM_CalAdjustGain, libnidmm), ViStatus, (ViSession, ViInt32, ViReal64, ViReal64, ViReal64), vi, mode, vrange, inputR, expectedValue)
end

function niDMM_CalAdjustOffset(vi, mode, vrange, inputR)
    ccall((:niDMM_CalAdjustOffset, libnidmm), ViStatus, (ViSession, ViInt32, ViReal64, ViReal64), vi, mode, vrange, inputR)
end

function niDMM_CalAdjustMisc(vi, typ)
    ccall((:niDMM_CalAdjustMisc, libnidmm), ViStatus, (ViSession, ViInt32), vi, typ)
end

function niDMM_CalAdjustLC(vi, typ)
    ccall((:niDMM_CalAdjustLC, libnidmm), ViStatus, (ViSession, ViInt32), vi, typ)
end

function niDMM_CalAdjustACFilter(vi, mode, vrange, frequency, expectedValue)
    ccall((:niDMM_CalAdjustACFilter, libnidmm), ViStatus, (ViSession, ViInt32, ViReal64, ViReal64, ViReal64), vi, mode, vrange, frequency, expectedValue)
end

function niDMM_RestoreLastExtCalConstants(vi)
    ccall((:niDMM_RestoreLastExtCalConstants, libnidmm), ViStatus, (ViSession,), vi)
end

function niDMM_SetCalPassword(vi, oldPassword, newPassword)
    ccall((:niDMM_SetCalPassword, libnidmm), ViStatus, (ViSession, Ptr{ViChar}, Ptr{ViChar}), vi, oldPassword, newPassword)
end

function niDMM_GetExtCalRecommendedInterval(vi, months)
    ccall((:niDMM_GetExtCalRecommendedInterval, libnidmm), ViStatus, (ViSession, Ptr{ViInt32}), vi, months)
end

function niDMM_SetCalUserDefinedInfo(vi, info)
    ccall((:niDMM_SetCalUserDefinedInfo, libnidmm), ViStatus, (ViSession, Ptr{ViChar}), vi, info)
end

function niDMM_GetCalUserDefinedInfoMaxSize(vi, infoSize)
    ccall((:niDMM_GetCalUserDefinedInfoMaxSize, libnidmm), ViStatus, (ViSession, Ptr{ViInt32}), vi, infoSize)
end

function niDMM_GetCalUserDefinedInfo(vi, bufferSize, info)
    ccall((:niDMM_GetCalUserDefinedInfo, libnidmm), ViStatus, (ViSession, ViInt32, Ptr{ViChar}), vi, bufferSize, info)
end

function niDMM_GetSelfCalSupported(vi, selfCalSupported)
    ccall((:niDMM_GetSelfCalSupported, libnidmm), ViStatus, (ViSession, Ptr{ViBoolean}), vi, selfCalSupported)
end

function niDMM_GetCalDateAndTime(vi, calType, month, day, year, hour, minute)
    ccall((:niDMM_GetCalDateAndTime, libnidmm), ViStatus, (ViSession, ViInt32, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}), vi, calType, month, day, year, hour, minute)
end

function niDMM_GetCalCount(vi, calType, cnt)
    ccall((:niDMM_GetCalCount, libnidmm), ViStatus, (ViSession, ViInt32, Ptr{ViInt32}), vi, calType, cnt)
end

function niDMM_GetLastCalTemp(vi, calType, temperature)
    ccall((:niDMM_GetLastCalTemp, libnidmm), ViStatus, (ViSession, ViInt32, Ptr{ViReal64}), vi, calType, temperature)
end

function niDMM_GetDevTemp(vi, reserved, temperature)
    ccall((:niDMM_GetDevTemp, libnidmm), ViStatus, (ViSession, ViString, Ptr{ViReal64}), vi, reserved, temperature)
end

function niDMM_ConfigureTransducerType(vi, transducerType)
    ccall((:niDMM_ConfigureTransducerType, libnidmm), ViStatus, (ViSession, ViInt32), vi, transducerType)
end

function niDMM_ConfigureThermocouple(vi, thermocoupleType, refJunctionType)
    ccall((:niDMM_ConfigureThermocouple, libnidmm), ViStatus, (ViSession, ViInt32, ViInt32), vi, thermocoupleType, refJunctionType)
end

function niDMM_ConfigureFixedRefJunction(vi, fixedRefJunction)
    ccall((:niDMM_ConfigureFixedRefJunction, libnidmm), ViStatus, (ViSession, ViReal64), vi, fixedRefJunction)
end

function niDMM_ConfigureRTDType(vi, rtdType, resistance)
    ccall((:niDMM_ConfigureRTDType, libnidmm), ViStatus, (ViSession, ViInt32, ViReal64), vi, rtdType, resistance)
end

function niDMM_ConfigureRTDCustom(vi, a, b, c)
    ccall((:niDMM_ConfigureRTDCustom, libnidmm), ViStatus, (ViSession, ViReal64, ViReal64, ViReal64), vi, a, b, c)
end

function niDMM_ConfigureThermistorType(vi, thermistorType)
    ccall((:niDMM_ConfigureThermistorType, libnidmm), ViStatus, (ViSession, ViInt32), vi, thermistorType)
end

function niDMM_ConfigureThermistorCustom(vi, a, b, c)
    ccall((:niDMM_ConfigureThermistorCustom, libnidmm), ViStatus, (ViSession, ViReal64, ViReal64, ViReal64), vi, a, b, c)
end
