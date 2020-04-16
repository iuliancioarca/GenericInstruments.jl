# Connect for Visa instruments
function connect!(resmgr, instr::INSTR)
	Instruments.connect!(resmgr, instr.obj, instr.address)
	instr.initialized = true
end

function disconnect!(instr::INSTR)
	Instruments.disconnect!(instr.obj)
	instr.initialized = false
end
disconnect!(resmgr, instr) = disconnect!(instr)

# Connect for NI PXI
#connect!(resmgr, instr)    = niScope_init(instr) #resmgr is dummy
#disconnect!(resmgr, instr) = niScope_close(instr) #resmgr is dummy

function set_instr_state!(resmgr, x...; act = disconnect!)
    for instr in x
        act(resmgr, instr)
    end
end

