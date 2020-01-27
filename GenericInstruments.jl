using Instruments
import Instruments: ResourceManager, GenericInstrument, connect!, disconnect!, write, read, query

mutable struct INSTR{instr_name}
    name
    address
    obj
end
# Generic instrument constructor
INSTR(instr_name, address) = INSTR{instr_name}(instr_name, address, GenericInstrument())

connect!(rm, instr)     = connect!(rm, instr.obj, instr.address)
disconnect!(instr)      = disconnect!(instr.obj)
disconnect!(rm, instr)  = disconnect!(instr.obj)

function set_instr_state!(rm, x...; act = disconnect!)
    for instr in x
        act(rm, instr)
    end
end
function set_volt(psu::INSTR{:Agilent}, volt = 0)
    # write(psu.obj,"some instruction 1")
    println("Agilent was called!")
end
function set_volt(psu::INSTR{:Tek}, volt = 0)
    # write(psu.obj,"some instruction 2")
    println("Tek was called!")
end

# instantiate obj
rm = ResourceManager()
my_psu1 = INSTR(:Agilent, "GPIB0::14::INSTR")
my_psu2 = INSTR(:Tek, "GPIB0::7::INSTR")
set_instr_state!(rm, my_psu1, my_psu2; act = connect!) #this will error if no instruments availale
# USAGE
set_volt(my_psu2)
# Disconnect everything
set_instr_state!(rm, my_psu1, my_psu2)