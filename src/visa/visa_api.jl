# Julia wrapper for header: visa.h
# Automatically generated using Clang.jl

function viOpenDefaultRM(vi)
    ccall((:viOpenDefaultRM, libvisa), ViStatus, (ViPSession,), vi)
end

function viFindRsrc(sesn, expr, vi, retCnt, desc)
    ccall((:viFindRsrc, libvisa), ViStatus, (ViSession, ViConstString, ViPFindList, ViPUInt32, Ptr{ViChar}), sesn, expr, vi, retCnt, desc)
end

function viFindNext(vi, desc)
    ccall((:viFindNext, libvisa), ViStatus, (ViFindList, Ptr{ViChar}), vi, desc)
end

function viParseRsrc(rmSesn, rsrcName, intfType, intfNum)
    ccall((:viParseRsrc, libvisa), ViStatus, (ViSession, ViConstRsrc, ViPUInt16, ViPUInt16), rmSesn, rsrcName, intfType, intfNum)
end

function viParseRsrcEx(rmSesn, rsrcName, intfType, intfNum, rsrcClass, expandedUnaliasedName, aliasIfExists)
    ccall((:viParseRsrcEx, libvisa), ViStatus, (ViSession, ViConstRsrc, ViPUInt16, ViPUInt16, Ptr{ViChar}, Ptr{ViChar}, Ptr{ViChar}), rmSesn, rsrcName, intfType, intfNum, rsrcClass, expandedUnaliasedName, aliasIfExists)
end

function viOpen(sesn, name, mode, timeout, vi)
    ccall((:viOpen, libvisa), ViStatus, (ViSession, ViConstRsrc, ViAccessMode, ViUInt32, ViPSession), sesn, name, mode, timeout, vi)
end

function viClose(vi)
    ccall((:viClose, libvisa), ViStatus, (ViObject,), vi)
end

function viSetAttribute(vi, attrName, attrValue)
    ccall((:viSetAttribute, libvisa), ViStatus, (ViObject, ViAttr, ViAttrState), vi, attrName, attrValue)
end

function viGetAttribute(vi, attrName, attrValue)
    ccall((:viGetAttribute, libvisa), ViStatus, (ViObject, ViAttr, Ptr{Cvoid}), vi, attrName, attrValue)
end

function viStatusDesc(vi, status, desc)
    ccall((:viStatusDesc, libvisa), ViStatus, (ViObject, ViStatus, Ptr{ViChar}), vi, status, desc)
end

function viTerminate(vi, degree, jobId)
    ccall((:viTerminate, libvisa), ViStatus, (ViObject, ViUInt16, ViJobId), vi, degree, jobId)
end

function viLock(vi, lockType, timeout, requestedKey, accessKey)
    ccall((:viLock, libvisa), ViStatus, (ViSession, ViAccessMode, ViUInt32, ViConstKeyId, Ptr{ViChar}), vi, lockType, timeout, requestedKey, accessKey)
end

function viUnlock(vi)
    ccall((:viUnlock, libvisa), ViStatus, (ViSession,), vi)
end

function viEnableEvent(vi, eventType, mechanism, context)
    ccall((:viEnableEvent, libvisa), ViStatus, (ViSession, ViEventType, ViUInt16, ViEventFilter), vi, eventType, mechanism, context)
end

function viDisableEvent(vi, eventType, mechanism)
    ccall((:viDisableEvent, libvisa), ViStatus, (ViSession, ViEventType, ViUInt16), vi, eventType, mechanism)
end

function viDiscardEvents(vi, eventType, mechanism)
    ccall((:viDiscardEvents, libvisa), ViStatus, (ViSession, ViEventType, ViUInt16), vi, eventType, mechanism)
end

function viWaitOnEvent(vi, inEventType, timeout, outEventType, outContext)
    ccall((:viWaitOnEvent, libvisa), ViStatus, (ViSession, ViEventType, ViUInt32, ViPEventType, ViPEvent), vi, inEventType, timeout, outEventType, outContext)
end

function viInstallHandler(vi, eventType, handler, userHandle)
    ccall((:viInstallHandler, libvisa), ViStatus, (ViSession, ViEventType, ViHndlr, ViAddr), vi, eventType, handler, userHandle)
end

function viUninstallHandler(vi, eventType, handler, userHandle)
    ccall((:viUninstallHandler, libvisa), ViStatus, (ViSession, ViEventType, ViHndlr, ViAddr), vi, eventType, handler, userHandle)
end

function viRead(vi, buf, cnt, retCnt)
    ccall((:viRead, libvisa), ViStatus, (ViSession, ViPBuf, ViUInt32, ViPUInt32), vi, buf, cnt, retCnt)
end

function viReadAsync(vi, buf, cnt, jobId)
    ccall((:viReadAsync, libvisa), ViStatus, (ViSession, ViPBuf, ViUInt32, ViPJobId), vi, buf, cnt, jobId)
end

function viReadToFile(vi, filename, cnt, retCnt)
    ccall((:viReadToFile, libvisa), ViStatus, (ViSession, ViConstString, ViUInt32, ViPUInt32), vi, filename, cnt, retCnt)
end

function viWrite(vi, buf, cnt, retCnt)
    ccall((:viWrite, libvisa), ViStatus, (ViSession, ViConstBuf, ViUInt32, ViPUInt32), vi, buf, cnt, retCnt)
end

function viWriteAsync(vi, buf, cnt, jobId)
    ccall((:viWriteAsync, libvisa), ViStatus, (ViSession, ViConstBuf, ViUInt32, ViPJobId), vi, buf, cnt, jobId)
end

function viWriteFromFile(vi, filename, cnt, retCnt)
    ccall((:viWriteFromFile, libvisa), ViStatus, (ViSession, ViConstString, ViUInt32, ViPUInt32), vi, filename, cnt, retCnt)
end

function viAssertTrigger(vi, protocol)
    ccall((:viAssertTrigger, libvisa), ViStatus, (ViSession, ViUInt16), vi, protocol)
end

function viReadSTB(vi, status)
    ccall((:viReadSTB, libvisa), ViStatus, (ViSession, ViPUInt16), vi, status)
end

function viClear(vi)
    ccall((:viClear, libvisa), ViStatus, (ViSession,), vi)
end

function viSetBuf(vi, mask, sz)
    ccall((:viSetBuf, libvisa), ViStatus, (ViSession, ViUInt16, ViUInt32), vi, mask, sz)
end

function viFlush(vi, mask)
    ccall((:viFlush, libvisa), ViStatus, (ViSession, ViUInt16), vi, mask)
end

function viBufWrite(vi, buf, cnt, retCnt)
    ccall((:viBufWrite, libvisa), ViStatus, (ViSession, ViConstBuf, ViUInt32, ViPUInt32), vi, buf, cnt, retCnt)
end

function viBufRead(vi, buf, cnt, retCnt)
    ccall((:viBufRead, libvisa), ViStatus, (ViSession, ViPBuf, ViUInt32, ViPUInt32), vi, buf, cnt, retCnt)
end

function viVPrintf(vi, writeFmt, params)
    ccall((:viVPrintf, libvisa), ViStatus, (ViSession, ViConstString, ViVAList), vi, writeFmt, params)
end

function viVSPrintf(vi, buf, writeFmt, parms)
    ccall((:viVSPrintf, libvisa), ViStatus, (ViSession, ViBuf, ViConstString, ViVAList), vi, buf, writeFmt, parms)
end

function viVScanf(vi, readFmt, params)
    ccall((:viVScanf, libvisa), ViStatus, (ViSession, ViConstString, ViVAList), vi, readFmt, params)
end

function viVSScanf(vi, buf, readFmt, parms)
    ccall((:viVSScanf, libvisa), ViStatus, (ViSession, ViConstBuf, ViConstString, ViVAList), vi, buf, readFmt, parms)
end

function viVQueryf(vi, writeFmt, readFmt, params)
    ccall((:viVQueryf, libvisa), ViStatus, (ViSession, ViConstString, ViConstString, ViVAList), vi, writeFmt, readFmt, params)
end

function viIn8(vi, space, offset, val8)
    ccall((:viIn8, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViPUInt8), vi, space, offset, val8)
end

function viOut8(vi, space, offset, val8)
    ccall((:viOut8, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViUInt8), vi, space, offset, val8)
end

function viIn16(vi, space, offset, val16)
    ccall((:viIn16, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViPUInt16), vi, space, offset, val16)
end

function viOut16(vi, space, offset, val16)
    ccall((:viOut16, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViUInt16), vi, space, offset, val16)
end

function viIn32(vi, space, offset, val32)
    ccall((:viIn32, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViPUInt32), vi, space, offset, val32)
end

function viOut32(vi, space, offset, val32)
    ccall((:viOut32, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViUInt32), vi, space, offset, val32)
end

function viIn64(vi, space, offset, val64)
    ccall((:viIn64, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViPUInt64), vi, space, offset, val64)
end

function viOut64(vi, space, offset, val64)
    ccall((:viOut64, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViUInt64), vi, space, offset, val64)
end

function viIn8Ex(vi, space, offset, val8)
    ccall((:viIn8Ex, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViPUInt8), vi, space, offset, val8)
end

function viOut8Ex(vi, space, offset, val8)
    ccall((:viOut8Ex, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViUInt8), vi, space, offset, val8)
end

function viIn16Ex(vi, space, offset, val16)
    ccall((:viIn16Ex, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViPUInt16), vi, space, offset, val16)
end

function viOut16Ex(vi, space, offset, val16)
    ccall((:viOut16Ex, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViUInt16), vi, space, offset, val16)
end

function viIn32Ex(vi, space, offset, val32)
    ccall((:viIn32Ex, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViPUInt32), vi, space, offset, val32)
end

function viOut32Ex(vi, space, offset, val32)
    ccall((:viOut32Ex, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViUInt32), vi, space, offset, val32)
end

function viIn64Ex(vi, space, offset, val64)
    ccall((:viIn64Ex, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViPUInt64), vi, space, offset, val64)
end

function viOut64Ex(vi, space, offset, val64)
    ccall((:viOut64Ex, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViUInt64), vi, space, offset, val64)
end

function viMoveIn8(vi, space, offset, len, buf8)
    ccall((:viMoveIn8, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViBusSize, ViAUInt8), vi, space, offset, len, buf8)
end

function viMoveOut8(vi, space, offset, len, buf8)
    ccall((:viMoveOut8, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViBusSize, ViAUInt8), vi, space, offset, len, buf8)
end

function viMoveIn16(vi, space, offset, len, buf16)
    ccall((:viMoveIn16, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViBusSize, ViAUInt16), vi, space, offset, len, buf16)
end

function viMoveOut16(vi, space, offset, len, buf16)
    ccall((:viMoveOut16, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViBusSize, ViAUInt16), vi, space, offset, len, buf16)
end

function viMoveIn32(vi, space, offset, len, buf32)
    ccall((:viMoveIn32, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViBusSize, ViAUInt32), vi, space, offset, len, buf32)
end

function viMoveOut32(vi, space, offset, len, buf32)
    ccall((:viMoveOut32, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViBusSize, ViAUInt32), vi, space, offset, len, buf32)
end

function viMoveIn64(vi, space, offset, len, buf64)
    ccall((:viMoveIn64, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViBusSize, ViAUInt64), vi, space, offset, len, buf64)
end

function viMoveOut64(vi, space, offset, len, buf64)
    ccall((:viMoveOut64, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViBusSize, ViAUInt64), vi, space, offset, len, buf64)
end

function viMoveIn8Ex(vi, space, offset, len, buf8)
    ccall((:viMoveIn8Ex, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViBusSize, ViAUInt8), vi, space, offset, len, buf8)
end

function viMoveOut8Ex(vi, space, offset, len, buf8)
    ccall((:viMoveOut8Ex, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViBusSize, ViAUInt8), vi, space, offset, len, buf8)
end

function viMoveIn16Ex(vi, space, offset, len, buf16)
    ccall((:viMoveIn16Ex, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViBusSize, ViAUInt16), vi, space, offset, len, buf16)
end

function viMoveOut16Ex(vi, space, offset, len, buf16)
    ccall((:viMoveOut16Ex, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViBusSize, ViAUInt16), vi, space, offset, len, buf16)
end

function viMoveIn32Ex(vi, space, offset, len, buf32)
    ccall((:viMoveIn32Ex, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViBusSize, ViAUInt32), vi, space, offset, len, buf32)
end

function viMoveOut32Ex(vi, space, offset, len, buf32)
    ccall((:viMoveOut32Ex, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViBusSize, ViAUInt32), vi, space, offset, len, buf32)
end

function viMoveIn64Ex(vi, space, offset, len, buf64)
    ccall((:viMoveIn64Ex, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViBusSize, ViAUInt64), vi, space, offset, len, buf64)
end

function viMoveOut64Ex(vi, space, offset, len, buf64)
    ccall((:viMoveOut64Ex, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViBusSize, ViAUInt64), vi, space, offset, len, buf64)
end

function viMove(vi, srcSpace, srcOffset, srcWidth, destSpace, destOffset, destWidth, srcLength)
    ccall((:viMove, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViUInt16, ViUInt16, ViBusAddress, ViUInt16, ViBusSize), vi, srcSpace, srcOffset, srcWidth, destSpace, destOffset, destWidth, srcLength)
end

function viMoveAsync(vi, srcSpace, srcOffset, srcWidth, destSpace, destOffset, destWidth, srcLength, jobId)
    ccall((:viMoveAsync, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViUInt16, ViUInt16, ViBusAddress, ViUInt16, ViBusSize, ViPJobId), vi, srcSpace, srcOffset, srcWidth, destSpace, destOffset, destWidth, srcLength, jobId)
end

function viMoveEx(vi, srcSpace, srcOffset, srcWidth, destSpace, destOffset, destWidth, srcLength)
    ccall((:viMoveEx, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViUInt16, ViUInt16, ViBusAddress64, ViUInt16, ViBusSize), vi, srcSpace, srcOffset, srcWidth, destSpace, destOffset, destWidth, srcLength)
end

function viMoveAsyncEx(vi, srcSpace, srcOffset, srcWidth, destSpace, destOffset, destWidth, srcLength, jobId)
    ccall((:viMoveAsyncEx, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViUInt16, ViUInt16, ViBusAddress64, ViUInt16, ViBusSize, ViPJobId), vi, srcSpace, srcOffset, srcWidth, destSpace, destOffset, destWidth, srcLength, jobId)
end

function viMapAddress(vi, mapSpace, mapOffset, mapSize, access, suggested, address)
    ccall((:viMapAddress, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress, ViBusSize, ViBoolean, ViAddr, ViPAddr), vi, mapSpace, mapOffset, mapSize, access, suggested, address)
end

function viUnmapAddress(vi)
    ccall((:viUnmapAddress, libvisa), ViStatus, (ViSession,), vi)
end

function viMapAddressEx(vi, mapSpace, mapOffset, mapSize, access, suggested, address)
    ccall((:viMapAddressEx, libvisa), ViStatus, (ViSession, ViUInt16, ViBusAddress64, ViBusSize, ViBoolean, ViAddr, ViPAddr), vi, mapSpace, mapOffset, mapSize, access, suggested, address)
end

function viPeek8(vi, address, val8)
    ccall((:viPeek8, libvisa), Cvoid, (ViSession, ViAddr, ViPUInt8), vi, address, val8)
end

function viPoke8(vi, address, val8)
    ccall((:viPoke8, libvisa), Cvoid, (ViSession, ViAddr, ViUInt8), vi, address, val8)
end

function viPeek16(vi, address, val16)
    ccall((:viPeek16, libvisa), Cvoid, (ViSession, ViAddr, ViPUInt16), vi, address, val16)
end

function viPoke16(vi, address, val16)
    ccall((:viPoke16, libvisa), Cvoid, (ViSession, ViAddr, ViUInt16), vi, address, val16)
end

function viPeek32(vi, address, val32)
    ccall((:viPeek32, libvisa), Cvoid, (ViSession, ViAddr, ViPUInt32), vi, address, val32)
end

function viPoke32(vi, address, val32)
    ccall((:viPoke32, libvisa), Cvoid, (ViSession, ViAddr, ViUInt32), vi, address, val32)
end

function viPeek64(vi, address, val64)
    ccall((:viPeek64, libvisa), Cvoid, (ViSession, ViAddr, ViPUInt64), vi, address, val64)
end

function viPoke64(vi, address, val64)
    ccall((:viPoke64, libvisa), Cvoid, (ViSession, ViAddr, ViUInt64), vi, address, val64)
end

function viMemAlloc(vi, sz, offset)
    ccall((:viMemAlloc, libvisa), ViStatus, (ViSession, ViBusSize, ViPBusAddress), vi, sz, offset)
end

function viMemFree(vi, offset)
    ccall((:viMemFree, libvisa), ViStatus, (ViSession, ViBusAddress), vi, offset)
end

function viMemAllocEx(vi, sz, offset)
    ccall((:viMemAllocEx, libvisa), ViStatus, (ViSession, ViBusSize, ViPBusAddress64), vi, sz, offset)
end

function viMemFreeEx(vi, offset)
    ccall((:viMemFreeEx, libvisa), ViStatus, (ViSession, ViBusAddress64), vi, offset)
end

function viGpibControlREN(vi, mode)
    ccall((:viGpibControlREN, libvisa), ViStatus, (ViSession, ViUInt16), vi, mode)
end

function viGpibControlATN(vi, mode)
    ccall((:viGpibControlATN, libvisa), ViStatus, (ViSession, ViUInt16), vi, mode)
end

function viGpibSendIFC(vi)
    ccall((:viGpibSendIFC, libvisa), ViStatus, (ViSession,), vi)
end

function viGpibCommand(vi, cmd, cnt, retCnt)
    ccall((:viGpibCommand, libvisa), ViStatus, (ViSession, ViConstBuf, ViUInt32, ViPUInt32), vi, cmd, cnt, retCnt)
end

function viGpibPassControl(vi, primAddr, secAddr)
    ccall((:viGpibPassControl, libvisa), ViStatus, (ViSession, ViUInt16, ViUInt16), vi, primAddr, secAddr)
end

function viVxiCommandQuery(vi, mode, cmd, response)
    ccall((:viVxiCommandQuery, libvisa), ViStatus, (ViSession, ViUInt16, ViUInt32, ViPUInt32), vi, mode, cmd, response)
end

function viAssertUtilSignal(vi, line)
    ccall((:viAssertUtilSignal, libvisa), ViStatus, (ViSession, ViUInt16), vi, line)
end

function viAssertIntrSignal(vi, mode, statusID)
    ccall((:viAssertIntrSignal, libvisa), ViStatus, (ViSession, ViInt16, ViUInt32), vi, mode, statusID)
end

function viMapTrigger(vi, trigSrc, trigDest, mode)
    ccall((:viMapTrigger, libvisa), ViStatus, (ViSession, ViInt16, ViInt16, ViUInt16), vi, trigSrc, trigDest, mode)
end

function viUnmapTrigger(vi, trigSrc, trigDest)
    ccall((:viUnmapTrigger, libvisa), ViStatus, (ViSession, ViInt16, ViInt16), vi, trigSrc, trigDest)
end

function viUsbControlOut(vi, bmRequestType, bRequest, wValue, wIndex, wLength, buf)
    ccall((:viUsbControlOut, libvisa), ViStatus, (ViSession, ViInt16, ViInt16, ViUInt16, ViUInt16, ViUInt16, ViConstBuf), vi, bmRequestType, bRequest, wValue, wIndex, wLength, buf)
end

function viUsbControlIn(vi, bmRequestType, bRequest, wValue, wIndex, wLength, buf, retCnt)
    ccall((:viUsbControlIn, libvisa), ViStatus, (ViSession, ViInt16, ViInt16, ViUInt16, ViUInt16, ViUInt16, ViPBuf, ViPUInt16), vi, bmRequestType, bRequest, wValue, wIndex, wLength, buf, retCnt)
end

function viPxiReserveTriggers(vi, cnt, trigBuses, trigLines, failureIndex)
    ccall((:viPxiReserveTriggers, libvisa), ViStatus, (ViSession, ViInt16, ViAInt16, ViAInt16, ViPInt16), vi, cnt, trigBuses, trigLines, failureIndex)
end

function viVxiServantResponse(vi, mode, resp)
    ccall((:viVxiServantResponse, libvisa), ViStatus, (ViSession, ViInt16, ViUInt32), vi, mode, resp)
end
# Julia wrapper for header: visatype.h
# Automatically generated using Clang.jl

# Julia wrapper for header: vpptype.h
# Automatically generated using Clang.jl