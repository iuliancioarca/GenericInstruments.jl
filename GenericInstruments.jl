using Instruments
import Instruments: ResourceManager, GenericInstrument, connect!, disconnect!, write, read, query

mutable struct INSTR{instr_name}
    name::Symbol
    address::String
    obj::GenericInstrument
end
# Generic instrument constructor
INSTR(instr_name, address) = INSTR{instr_name}(instr_name, address, GenericInstrument())

connect!(rm, instr)    = connect!(rm, instr.obj, instr.address)
disconnect!(instr)     = disconnect!(instr.obj)
disconnect!(rm, instr) = disconnect!(instr.obj)

function set_instr_state!(rm, x...; act = disconnect!)
    for instr in x
        act(rm, instr)
    end
end
