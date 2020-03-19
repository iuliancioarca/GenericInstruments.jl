mutable struct INSTR{instr_name}
    name::Symbol
    address::String
    obj#::GenericInstrument; this needs to be anything, to accept PXI instruments
end
# Generic instrument constructor
INSTR(instr_name, address) = INSTR{instr_name}(instr_name, address, GenericInstrument())

# Connect for Visa instruments
connect!(rm, instr)    = connect!(rm, instr.obj, instr.address)
disconnect!(instr)     = disconnect!(instr.obj)
disconnect!(rm, instr) = disconnect!(instr.obj)
# Connect for NI PXI
connect!(rm, instr)    = niScope_init(instr) #rm is dummy
disconnect!(rm, instr) = niScope_close(instr) #rm is dummy

function set_instr_state!(rm, x...; act = disconnect!)
    for instr in x
        act(rm, instr)
    end
end

