# Low level function examples
####################################
cd(raw"C:\Iulian\GenericInstruments.jl-master\src")
include("GenericInstruments.jl")
using .GenericInstruments
const GI = GenericInstruments
####################################
# Instantiate obj
rm   = GI.ResourceManager()
scope1 = GI.INSTR(:HDO6054A, "USB0::0x05FF::0x1023::4066N51752::INSTR")
niScope1 = GI.INSTR(:NI5122,"PXI1Slot3")
dmm1 = GI.INSTR(:KE2000, "GPIB0::2::INSTR")
psu1 = GI.INSTR(:KeysightE3645A, "GPIB0::5::INSTR")
psu2 = GI.INSTR(:AgilentE3646A, "GPIB0::6::INSTR")
fg1  = GI.INSTR(:Keysight33500B, "USB0::0x0957::0x2C07::MY52803073::INSTR")
GI.set_instr_state!(rm, scope1, dmm1, psu1, psu2, fg1; act = GI.connect!) #this will error if no instruments availale
####################################
# USAGE
####################################
# Power supply
# IDN
GI.get_idn(psu1)
GI.get_idn(psu2)
# Reset
GI.reset_instr(psu1)
GI.reset_instr(psu2)
# Set range
GI.set_range(psu1,"output1","low")
GI.set_range(psu2,"output1","high")
# Set voltage
GI.set_volt(psu1,"output1",5)
GI.set_volt(psu2,"output1",3)
# Set current compliance
GI.set_compl(psu1,"output1",0.6)
GI.set_compl(psu2,"output1",1.1)
# Output on/off
GI.set_outp(psu1,"output1","on")
GI.set_outp(psu2,"output1","on")
# Multiple instructions
GI.set_volt_compl(psu1,"output1", 5, 0.1)
# Disconnect everything
GI.set_instr_state!(rm, psu1, psu2; act = GI.disconnect!)
####################################
# Fgen
# IDN
GI.get_idn(fg1)
# Reset
GI.reset_instr(fg1)
# Output load INF
GI.set_load(fg1,1,"INF")
# Wfm
GI.set_wfm(fg1,1,"square")
# Amplitude
GI.set_amplit(fg1,1,"vpp",1)
# Offset
GI.set_offs(fg1,1,0.4)
# High level
GI.set_hilev(fg1,1,3)
# Low level
GI.set_lolev(fg1,1,1)
# Duty cycle
GI.set_duty(fg1,1,"square",22)
# Arbitrary waveform
GI.clear_arbs(fg1,1)
wfm = Float32.([0,0, 0,1, 1,1,1,-1,-1,-1,-1,-1,1,1,1, 0, 0,0,0,0]) # normed to -1:1
GI.send_arb(fg1,1,wfm,1e-7,"mywfm")
GI.set_wfm(fg1,1,"ARB")
GI.set_arb_wfm(fg1,1,"mywfm")
GI.set_burst_stat(fg1,1,"on")
GI.set_trig_sour(fg1,1,"BUS")
GI.set_outp(fg1,1,"on")
GI.send_soft_trig(fg1)
# Disconnect everything
GI.set_instr_state!(rm, fg1; act = GI.disconnect!)
####################################
# SCOPE
# Most commands needs Dicts...
GI.set_instr_state!(rm, scope1; act = GI.connect!)
# IDN
GI.get_idn(scope1)
# Fetch waveform from channel 1
y, initial_x, x_increm = GI.fetch_wfm(scope1,1)
# Default Setup
GI.default_setup(scope1)
# Vertical range
GI.set_vrange(scope1,1,12)
# Vertical scale
GI.set_vscale(scope1,1,0.2)
# Vertical offset
GI.set_voffs(scope1,1,2.2)
# Channel coupling
GI.set_coupling(scope1,1,2)
# Channel enabled
GI.set_ch_state(scope1,1,0)
# Probe attenuation
GI.set_atten(scope1,1,1)
# Screen Gridmode
GI.set_gridmode(scope1,1)
# Nr of averages
GI.set_nr_avg(scope1,1,10)
# EnhanceRes
GI.set_eres(scope1,1,1)
# Degauss
GI.degauss(scope1,4,"CP030A")
# Clear sweeps
GI.clear_sweeps(scope1) # ??
# Nr of acquisition points
GI.set_nr_pts(scope1,1e6)
# Sampling rate
GI.set_srate(scope1,50e6)
# Acquisition duration
GI.set_hduration(scope1,1e-3)
# Horizontal offset origin
GI.set_hoffs_div(scope1,1)
# Set Measurement
GI.set_meas(scope1,1,0,1,1) 
# Get Measurement
GI.get_meas(scope1,1)
# Set trigger source
GI.set_trg_src(scope1,0)
# Set trigger type
GI.set_trg_typ(scope1,0)
# Set trigger mode
GI.set_trg_mode(scope1,0)
# Set trigger slope
GI.set_trg_slope(scope1,0)
# Set trigger level
GI.set_trg_lev(scope1,1.2)
# Set trigger holdoff
GI.set_trg_holdoff(scope1,1e-3)
# Trigger delay time
GI.set_hoffs_t(scope1,11e-3)
# Set trigger coupling
GI.set_trg_cpl(scope1,1,0)
# BW limit
GI.set_bw_lim(scope1,1,0)
# Disconnect everything
GI.set_instr_state!(rm, scope1; act = GI.disconnect!)

# niScope
# Connect
GI.set_instr_state!(rm, niScope1; act = GI.connect!)
GI.niScope_AutoSetup(niScope1)
GI.niScope_ConfigureVertical(niScope1,0,5.0,0.5,Int32(1),1.0,Int16(1))
GI.niScope_ConfigureHorizontalTiming(niScope1,2e5,1000,0.1,1,1)
GI.niScope_ConfigureTriggerImmediate(niScope1)
GI.niScope_InitiateAcquisition(niScope1)
GI.niScope_ActualRecordLength(niScope1)
y,info = GI.fetch_wfm(niScope1,0)
plot(y)
# Disconnect everything
GI.set_instr_state!(rm, niScope1; act = GI.disconnect!)


# Digital Multimeter
# Connect
GI.set_instr_state!(rm, dmm1; act = GI.connect!)
# Reset
GI.reset_instr(dmm1)
# Clear
GI.clear_instr(dmm1)
# IDN
GI.get_idn(dmm1)
# Function
GI.set_fc(dmm1,"VOLT:DC")
# Function and range
GI.set_fc_range(dmm1,"VOLT",10)
GI.set_fc_range_auto(dmm1,"VOLT")
# Function and NPLC
GI.set_fc_nplc(dmm1,"VOLT",2)
# Init once
GI.init_meas(dmm1)
# Init continuous
GI.init_meas_continuous(dmm1,"ON")
# Abort
GI.abort_meas(dmm1)
# Read measurement
y, unit = GI.read_meas(dmm1)
# Disconnect
GI.set_instr_state!(rm, dmm1; act = GI.disconnect!)






