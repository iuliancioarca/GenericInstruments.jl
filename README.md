# GenericInstruments.jl
Wrapper over https://github.com/BBN-Q/Instruments.jl. Bundles similar functionalities of instruments under a single generic object: power supplies, arbitrary waveform generators, etc.

]add https://github.com/BBN-Q/Instruments.jl.git

using Instruments
# Low level function examples
```
cd(raw"C:\Iulian\Julia_Instrument_Drivers\v0.31\GenericInstruments.jl-master\src")
include("GenericInstruments.jl")
using .GenericInstruments
const GI = GenericInstruments
```
- Instantiate objects
```
rm   = GI.ResourceManager()
scope1 = GI.SCOPE.INSTR(:HDO6054A, "USB0::0x05FF::0x1023::4066N51752::INSTR")
psu1 = GI.PSU.INSTR(:KeysightE3645A, "GPIB0::5::INSTR")
psu2 = GI.PSU.INSTR(:AgilentE3646A, "GPIB0::6::INSTR")
fg1  = GI.FGEN.INSTR(:Keysight33500B, "USB0::0x0957::0x2C07::MY52803073::INSTR")
GI.PSU.set_instr_state!(rm, scope1, psu1, psu2, fg1; act = GI.connect!) #this will error if no instruments availale
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
# Disconnect
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
# Disconnect
GI.FGEN.set_instr_state!(rm, fg1; act = GI.disconnect!)
```
- SCOPE - Most commands needs Dicts...
```
GI.SCOPE.set_instr_state!(rm, scope1; act = GI.connect!)
# IDN
GI.SCOPE.get_idn(scope1)
# Fetch waveform from channel 1
y, initial_x, x_increm = GI.SCOPE.fetch_wfm(scope1,1)
# Default Setup
GI.SCOPE.default_setup(scope1)
# Vertical range
GI.SCOPE.set_vrange(scope1,1,12)
# Vertical scale
GI.SCOPE.set_vscale(scope1,1,0.2)
# Vertical offset
GI.SCOPE.set_voffs(scope1,1,2.2)
# Channel coupling
GI.SCOPE.set_coupling(scope1,1,1)
# Channel enabled
GI.SCOPE.set_ch_state(scope1,1,0)
# Probe attenuation
GI.SCOPE.set_atten(scope1,1,1)
# Screen Gridmode
GI.SCOPE.set_gridmode(scope1,1)
# Nr of averages
GI.SCOPE.set_nr_avg(scope1,1,10)
# EnhanceRes
GI.SCOPE.set_eres(scope1,1,1)
# Degauss
GI.SCOPE.degauss(scope1,4,"CP030A")
# Clear sweeps
GI.SCOPE.clear_sweeps(scope1) # ??
# Nr of acquisition points
GI.SCOPE.set_nr_pts(scope1,1e6)
# Sampling rate
GI.SCOPE.set_srate(scope1,50e6)
# Acquisition duration
GI.SCOPE.set_hduration(scope1,1e-3)
# Horizontal offset origin
GI.SCOPE.set_hoffs_div(scope1,1)
# Set Measurement
GI.SCOPE.set_meas(scope1,1,"amplitude",1,1) 
# Get Measurement
GI.SCOPE.get_meas(scope1,1)
# Set trigger source
GI.SCOPE.set_trg_src(scope1,0)
# Set trigger type
GI.SCOPE.set_trg_typ(scope1,0)
# Set trigger mode
GI.SCOPE.set_trg_mode(scope1,0)
# Set trigger slope
GI.SCOPE.set_trg_slope(scope1,0)
# Set trigger level
GI.SCOPE.set_trg_lev(scope1,1.2)
# Set trigger holdoff
GI.SCOPE.set_trg_holdoff(scope1,1e-3)
# Trigger delay time
GI.SCOPE.set_hoffs_t(scope1,11e-3)
# Set trigger coupling
GI.SCOPE.set_trg_cpl(scope1,1,0)
# BW limit
GI.SCOPE.set_bw_lim(scope1,1,0)
# Disconnect
GI.SCOPE.set_instr_state!(rm, scope1; act = GI.disconnect!)
```
- DMM
```
# Connect
GI.DMM.set_instr_state!(rm, dmm1; act = GI.connect!)
# Reset
GI.DMM.reset_instr(dmm1)
# Clear
GI.DMM.clear_instr(dmm1)
# IDN
GI.DMM.get_idn(dmm1)
# Function
GI.DMM.set_fc(dmm1,"VOLT:DC")
# Function and range
GI.DMM.set_fc_range(dmm1,"VOLT",10)
GI.DMM.set_fc_range_auto(dmm1,"VOLT")
# Function and NPLC
GI.DMM.set_fc_nplc(dmm1,"VOLT",2)
# Init once
GI.DMM.init_meas(dmm1)
# Init continuous
GI.DMM.init_meas_continuous(dmm1,"ON")
# Abort
GI.DMM.abort_meas(dmm1)
# Read measurement
y, unit = GI.DMM.read_meas(dmm1)
# Disconnect
GI.DMM.set_instr_state!(rm, dmm1; act = GI.disconnect!)
```
