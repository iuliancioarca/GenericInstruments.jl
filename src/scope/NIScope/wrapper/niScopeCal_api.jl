# Julia wrapper for header: niScopeCal.h
# Automatically generated using Clang.jl


function niScope_CalStart(resourceName, password, newSessionHandle)
    ccall((:niScope_CalStart, libniscope), ViStatus, (ViRsrc, ViConstString, Ptr{ViSession}), resourceName, password, newSessionHandle)
end

function niScope_CalEnd(vi, action)
    ccall((:niScope_CalEnd, libniscope), ViStatus, (ViSession, ViInt32), vi, action)
end

function niScope_CalChangePassword(vi, oldPassword, newPassword)
    ccall((:niScope_CalChangePassword, libniscope), ViStatus, (ViSession, ViConstString, ViConstString), vi, oldPassword, newPassword)
end

function niScope_CalFetchCount(vi, whichOne, calibrationCount)
    ccall((:niScope_CalFetchCount, libniscope), ViStatus, (ViSession, ViInt32, Ptr{ViInt32}), vi, whichOne, calibrationCount)
end

function niScope_CalFetchDate(vi, whichOne, year, month, day)
    ccall((:niScope_CalFetchDate, libniscope), ViStatus, (ViSession, ViInt32, Ptr{ViInt32}, Ptr{ViInt32}, Ptr{ViInt32}), vi, whichOne, year, month, day)
end

function niScope_CalFetchTemperature(vi, whichOne, temperature)
    ccall((:niScope_CalFetchTemperature, libniscope), ViStatus, (ViSession, ViInt32, Ptr{ViReal64}), vi, whichOne, temperature)
end

function niScope_CalFetchMiscInfo(vi, miscInfo)
    ccall((:niScope_CalFetchMiscInfo, libniscope), ViStatus, (ViSession, Ptr{ViChar}), vi, miscInfo)
end

function niScope_CalFetchInternalReference(vi, whichReference, internalRefValue)
    ccall((:niScope_CalFetchInternalReference, libniscope), ViStatus, (ViSession, ViInt32, Ptr{ViReal64}), vi, whichReference, internalRefValue)
end

function niScope_CalStoreMiscInfo(vi, miscInfo)
    ccall((:niScope_CalStoreMiscInfo, libniscope), ViStatus, (ViSession, ViConstString), vi, miscInfo)
end

function niScope_CalStoreInternalReference(vi, whichReference, internalRefValue)
    ccall((:niScope_CalStoreInternalReference, libniscope), ViStatus, (ViSession, ViInt32, ViReal64), vi, whichReference, internalRefValue)
end

function niScope_CalAdjustRange(vi, channelName, rng, stimulus)
    ccall((:niScope_CalAdjustRange, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViReal64), vi, channelName, rng, stimulus)
end

function niScope_CalAdjustVCXO(vi, stimulusFreq)
    ccall((:niScope_CalAdjustVCXO, libniscope), ViStatus, (ViSession, ViReal64), vi, stimulusFreq)
end

function niScope_CalAdjustDCM(vi, channelName, stimulusFreq)
    ccall((:niScope_CalAdjustDCM, libniscope), ViStatus, (ViSession, ViConstString, ViReal64), vi, channelName, stimulusFreq)
end

function niScope_CalAdjustOffset(vi, channelName, rng)
    ccall((:niScope_CalAdjustOffset, libniscope), ViStatus, (ViSession, ViConstString, ViReal64), vi, channelName, rng)
end

function niScope_CalAdjustOffsetRange(vi, channelName, rng, stimulus)
    ccall((:niScope_CalAdjustOffsetRange, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViReal64), vi, channelName, rng, stimulus)
end

function niScope_CalAdjustCompensationAttenuator(vi, channelName, rng)
    ccall((:niScope_CalAdjustCompensationAttenuator, libniscope), ViStatus, (ViSession, ViConstString, ViReal64), vi, channelName, rng)
end

function niScope_CalAdjustFrequencyResponse(vi, channelName, rng, stimulusFreq, stimulusAmp)
    ccall((:niScope_CalAdjustFrequencyResponse, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViReal64, ViReal64), vi, channelName, rng, stimulusFreq, stimulusAmp)
end

function niScope_CalAdjustInternalReference(vi, option, stimulus)
    ccall((:niScope_CalAdjustInternalReference, libniscope), ViStatus, (ViSession, ViInt32, ViReal64), vi, option, stimulus)
end

function niScope_CalRouteInternalReference(vi, option, whichReference)
    ccall((:niScope_CalRouteInternalReference, libniscope), ViStatus, (ViSession, ViInt32, ViInt32), vi, option, whichReference)
end

function niScope_CalAdjustAccessoryGainAndOffset(vi, channelName, posFs, gnd, negFs)
    ccall((:niScope_CalAdjustAccessoryGainAndOffset, libniscope), ViStatus, (ViSession, ViConstString, ViReal64, ViReal64, ViReal64), vi, channelName, posFs, gnd, negFs)
end

function niScope_CalSetAccessorySource(vi, channelName, calSource)
    ccall((:niScope_CalSetAccessorySource, libniscope), ViStatus, (ViSession, ViConstString, ViInt32), vi, channelName, calSource)
end

function niScope_CalMeasureRISDistribution(vi, channelName, maxTime, minBinPercent, distributionSize, distribution)
    ccall((:niScope_CalMeasureRISDistribution, libniscope), ViStatus, (ViSession, ViConstString, ViInt32, Ptr{ViReal64}, ViInt32, Ptr{ViInt32}), vi, channelName, maxTime, minBinPercent, distributionSize, distribution)
end