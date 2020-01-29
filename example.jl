# Low level function examples
####################################
include("hl_visa.jl")
include("PSU.jl")
include("FGEN.jl")
####################################
# Instantiate obj
rm   = ResourceManager()
psu1 = INSTR(:KeysightE3645A, "GPIB0::5::INSTR")
psu2 = INSTR(:AgilentE3646A, "GPIB0::6::INSTR")
fg1  = INSTR(:Keysight33500B, "USB0::0x0957::0x2C07::MY52803073::INSTR")
set_instr_state!(rm, psu1, psu2, fg1; act = connect!) #this will error if no instruments availale
####################################
# USAGE
####################################
# Power supply
# IDN
get_idn(psu1)
get_idn(psu2)
# Reset
reset_instr(psu1)
reset_instr(psu2)
# Set range
set_range(psu1,"low")
set_range(psu2,"high","output1")
# Set voltage
set_volt(psu1,5)
set_volt(psu2,3,"output1")
# Set current compliance
set_compl(psu1,0.6)
set_compl(psu2,1.1,"output1")
# Output on/off
set_outp(psu1,"on")
set_outp(psu2,"on","output1")
# Multiple instructions
set_volt_compl(psu1, 5, 0.1)
# Disconnect everything
set_instr_state!(rm, psu1, psu2; act = disconnect!)
####################################
# Fgen
# IDN
get_idn(fg1)
# Reset
reset_instr(fg1)
# Wfm
set_wfm(fg1)
# Disconnect everything
set_instr_state!(rm, fg1; act = disconnect!)