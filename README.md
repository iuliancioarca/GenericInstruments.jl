# GenericInstruments.jl
High level wrapper over https://github.com/BBN-Q/Instruments.jl. Bundles similar functionalities of instruments under a single generic object: power supplies, arbitrary waveform generators, etc.
# Low level function examples
```
cd(raw"C:\Iulian\Julia_Instrument_Drivers\v0.2\src")
include("GenericInstruments.jl")
using .GenericInstruments
const GI = GenericInstruments
```
- Instantiate objects
```
rm   = GI.ResourceManager()
psu1 = GI.PSU.INSTR(:KeysightE3645A, "GPIB0::5::INSTR")
psu2 = GI.PSU.INSTR(:AgilentE3646A, "GPIB0::6::INSTR")
fg1  = GI.FGEN.INSTR(:Keysight33500B, "USB0::0x0957::0x2C07::MY52803073::INSTR")
GI.PSU.set_instr_state!(rm, psu1, psu2, fg1; act = GI.connect!) #this will error if no instruments availale
```
- Power supply
```
# IDN
GI.PSU.get_idn(psu1)
GI.PSU.get_idn(psu2)
# Reset
GI.PSU.reset_instr(psu1)
GI.PSU.reset_instr(psu2)
# Set range
GI.PSU.set_range(psu1,"output1","low")
GI.PSU.set_range(psu2,"output1","high")
# Set voltage
GI.PSU.set_volt(psu1,"output1",5)
GI.PSU.set_volt(psu2,"output1",3)
# Set current compliance
GI.PSU.set_compl(psu1,"output1",0.6)
GI.PSU.set_compl(psu2,"output1",1.1)
# Output on/off
GI.PSU.set_outp(psu1,"output1","on")
GI.PSU.set_outp(psu2,"output1","on")
# Multiple instructions
GI.PSU.set_volt_compl(psu1,"output1", 5, 0.1)
# Disconnect everything
GI.PSU.set_instr_state!(rm, psu1, psu2; act = GI.disconnect!)
```
- Fgen
```
# IDN
GI.FGEN.get_idn(fg1)
# Reset
GI.FGEN.reset_instr(fg1)
# Output load INF
GI.FGEN.set_load(fg1,1,"INF")
# Wfm
GI.FGEN.set_wfm(fg1,1,"square")
# Amplitude
GI.FGEN.set_amplit(fg1,1,"vpp",1)
# Offset
GI.FGEN.set_offs(fg1,1,0.4)
# High level
GI.FGEN.set_hilev(fg1,1,3)
# Low level
GI.FGEN.set_lolev(fg1,1,1)
# Duty cycle
GI.FGEN.set_duty(fg1,1,"square",22)
# Arbitrary waveform
GI.FGEN.clear_arbs(fg1,1)
wfm = Float32.([0,0, 0,1, 1,1,1,-1,-1,-1,-1,-1,1,1,1, 0, 0,0,0,0]) # normed to -1:1
GI.FGEN.send_arb(fg1,1,wfm,1e-7,"mywfm")
GI.FGEN.set_wfm(fg1,1,"ARB")
GI.FGEN.set_arb_wfm(fg1,1,"mywfm")
# Burst mode
GI.FGEN.set_burst_stat(fg1,1,"on")
GI.FGEN.set_trig_sour(fg1,1,"BUS")
GI.FGEN.set_outp(fg1,1,"on")
GI.FGEN.send_soft_trig(fg1)
# Disconnect everything
GI.FGEN.set_instr_state!(rm, fg1; act = GI.disconnect!)
```
