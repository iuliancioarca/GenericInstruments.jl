using GenericInstruments
const GI = GenericInstruments
####################################
# Instantiate obj
resmgr   = GI.ResourceManager()
scope1   = GI.SCOPE.INSTR(:HDO6054A, "USB0::0x05FF::0x1023::4066N51752::INSTR")
dmm1 = GI.DMM.INSTR(:KE2000, "GPIB0::2::INSTR")
psu1 = GI.PSU.INSTR(:KeysightE3645A, "GPIB0::5::INSTR")
psu2 = GI.PSU.INSTR(:AgilentE3646A, "GPIB0::6::INSTR")
awg1 = GI.AWG.INSTR(:Keysight33500B, "USB0::0x0957::0x2C07::MY52803073::INSTR")
GI.SCOPE.set_instr_state!(resmgr, scope1, dmm1, psu1, psu2, awg1; act = GI.connect!) #this will error if no instruments availale
####################################
# USAGE
####################################
# Power supply
# IDN
GI.PSU.get_idn(psu1)
GI.PSU.get_idn(psu2)
# Reset
GI.PSU.reset_instr(psu1)
GI.PSU.reset_instr(psu2)
# Set range
GI.PSU.set_range(psu1,ch=1,vrang="low")
GI.PSU.set_range(psu2,ch=1,vrang="high")
# Set voltage
GI.PSU.set_volt(psu1,ch=1,volt=5)
GI.PSU.set_volt(psu2,ch=1,volt=3)
# Set current compliance
GI.PSU.set_compl(psu1,ch=1,crtlim=0.6)
GI.PSU.set_compl(psu2,ch=1,crtlim=1.1)
# Output on/off
GI.PSU.set_outp(psu1,ch=1,st="on")
GI.PSU.set_outp(psu2,ch=1,st="on")
# Multiple instructions
#GI.PSU.set_volt_compl(psu1,ch=1, 5, 0.1)
# Disconnect everything
GI.PSU.set_instr_state!(resmgr, psu1, psu2; act = GI.disconnect!)
####################################
# AWG
# IDN
GI.AWG.get_idn(awg1)
# Reset
GI.AWG.reset_instr(awg1)
# Output load INF
GI.AWG.set_load(awg1,ch=1,load="INF")
# Wfm
GI.AWG.set_wfm(awg1,ch=1,func="square")
# Amplitude
GI.AWG.set_amplit(awg1,ch=1,unit="vpp",volt=1)
# Offset
GI.AWG.set_offs(awg1,ch=1,volt=0.4)
# High level
GI.AWG.set_hilev(awg1,ch=1,volt=3)
# Low level
GI.AWG.set_lolev(awg1,ch=1,volt=1)
# Duty cycle
GI.AWG.set_duty(awg1,ch=1,func="square",duty=22)
# Arbitrary waveform
GI.AWG.clear_arbs(awg1,ch=1)
wfm = Float32.([0,0, 0,1, 1,1,1,-1,-1,-1,-1,-1,1,1,1, 0, 0,0,0,0]) # normed to -1:1
GI.AWG.send_arb(awg1,ch=1,wfm=wfm,dt=1e-7,arb="mywfm")
GI.AWG.set_wfm(awg1,ch=1,func="ARB")
GI.AWG.set_arb_wfm(awg1,ch=1,arb="mywfm")
GI.AWG.set_burst_stat(awg1,ch=1,st="on")
GI.AWG.set_trig_sour(awg1,ch=1,sour="BUS")
GI.AWG.set_outp(awg1,ch=1,st="on")
GI.AWG.send_soft_trig(awg1)
# Disconnect everything
GI.AWG.set_instr_state!(resmgr, awg1; act = GI.disconnect!)
####################################
# SCOPE
# Most commands needs Dicts...
GI.SCOPE.set_instr_state!(resmgr, scope1; act = GI.connect!)
# IDN
GI.SCOPE.get_idn(scope1)
# Fetch waveform from channel 1
y, initial_x, x_increm = GI.SCOPE.fetch_wfm(scope1,ch=1)
# Default Setup
GI.SCOPE.default_setup(scope1)
# Vertical range
GI.SCOPE.set_vrange(scope1,ch=1,vrang=12)
# Vertical scale
GI.SCOPE.set_vscale(scope1,ch=1,volt=0.2)
# Vertical offset
GI.SCOPE.set_voffs(scope1,ch=1,voffs=2.2)
# Channel coupling
GI.SCOPE.set_coupling(scope1,ch=1,cpl=2)
# Channel enabled
GI.SCOPE.set_ch_state(scope1,ch=1,st=0)
# Probe attenuation
GI.SCOPE.set_atten(scope1,ch=1,att=1)
# Screen Gridmode
GI.SCOPE.set_gridmode(scope1,gridmode=1)
# Nr of averages
GI.SCOPE.set_nr_avg(scope1,ch=1,navg=10)
# EnhanceRes
GI.SCOPE.set_eres(scope1,ch=1,bits=1)
# Degauss
GI.SCOPE.degauss(scope1,ch=4,probe="CP030A")
# Clear sweeps
GI.SCOPE.clear_sweeps(scope1) # ??
# Nr of acquisition points
GI.SCOPE.set_nr_pts(scope1,npts=1e6)
# Sampling rate
GI.SCOPE.set_srate(scope1,sr=50e6)
# Acquisition duration
GI.SCOPE.set_hduration(scope1,d=1e-3)
# Horizontal offset origin
GI.SCOPE.set_hoffs_div(scope1,href=1)
# Set Measurement
GI.SCOPE.set_meas(scope1,ch=1,fct=0,par=1,vw=1)
# Get Measurement
GI.SCOPE.get_meas(scope1,par=1)
# Set trigger source
GI.SCOPE.set_trg_src(scope1,ch=0)
# Set trigger type
GI.SCOPE.set_trg_typ(scope1,tp=0)
# Set trigger mode
GI.SCOPE.set_trg_mode(scope1,mode=0)
# Set trigger slope
GI.SCOPE.set_trg_slope(scope1,slp=0)
# Set trigger level
GI.SCOPE.set_trg_lev(scope1,lev=1.2)
# Set trigger holdoff
GI.SCOPE.set_trg_holdoff(scope1,hf=1e-3)
# Trigger delay time
GI.SCOPE.set_hoffs_t(scope1,href=11e-3)
# Set trigger coupling
GI.SCOPE.set_trg_cpl(scope1,ch=1,cpl=0)
# BW limit
GI.SCOPE.set_bw_lim(scope1,ch=1,bw=0)
# Disconnect everything
GI.SCOPE.set_instr_state!(resmgr, scope1; act = GI.disconnect!)

# Digital Multimeter
# Connect
GI.set_instr_state!(resmgr, dmm1; act = GI.connect!)
# Reset
GI.reset_instr(dmm1)
# Clear
GI.clear_instr(dmm1)
# IDN
GI.get_idn(dmm1)
# Function
GI.set_fc(dmm1,fc="VOLT:DC")
# Function and range
GI.set_fc_range(dmm1,fc="VOLT",rn=10)
GI.set_fc_range_auto(dmm1,fc="VOLT")
# Function and NPLC
GI.set_fc_nplc(dmm1,fc="VOLT",nplc=2)
# Init once
GI.init_meas(dmm1)
# Init continuous
GI.init_meas_continuous(dmm1,st="ON")
# Abort
GI.abort_meas(dmm1)
# Read measurement
y, unit = GI.read_meas(dmm1)
# Disconnect
GI.set_instr_state!(resmgr, dmm1; act = GI.disconnect!)
