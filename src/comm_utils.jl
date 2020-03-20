# Connect for Visa instruments
connect!(resmgr, instr)    = connect!(resmgr, instr.obj, instr.address)
disconnect!(instr)     = disconnect!(instr.obj)
disconnect!(resmgr, instr) = disconnect!(instr.obj)
# Connect for NI PXI
connect!(resmgr, instr)    = niScope_init(instr) #resmgr is dummy
disconnect!(resmgr, instr) = niScope_close(instr) #resmgr is dummy

function set_instr_state!(resmgr, x...; act = disconnect!)
    for instr in x
        act(resmgr, instr)
    end
end

