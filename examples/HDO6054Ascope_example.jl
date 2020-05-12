using GenericInstruments
GI = GenericInstruments
####################################
resmgr = GI.viOpenDefaultRM()
# Instantiate obj
scope1   = GI.SCOPE.INSTR(:HDO6054A, "USB0::0x05FF::0x1023::4066N51752::INSTR")
GI.SCOPE.connect!(resmgr, scope1)
# Most commands needs Dicts...
# IDN
GI.SCOPE.get_idn(scope1)
# Fetch waveform from channel 1
y, initial_x, x_increm = GI.SCOPE.fetch_wfm(scope1;ch="1")
# Default Setup
GI.SCOPE.default_setup(scope1)
# Vertical range
GI.SCOPE.set_vrange(scope1;ch="1",vrang=12)
# Vertical scale
GI.SCOPE.set_vscale(scope1;ch="1",volt=0.2)
# Vertical offset
GI.SCOPE.set_voffs(scope1;ch="1",voffs=2.2)
# Channel coupling
GI.SCOPE.set_coupling(scope1;ch="1",cpl="ac")
# Channel enabled
GI.SCOPE.set_state(scope1;ch="1",st="off")
# Probe attenuation
GI.SCOPE.set_atten(scope1;ch="1",att="10x")#not working, check VBS
# Screen Gridmode
GI.SCOPE.set_gridmode(scope1;gridmode="single")
# Nr of averages
GI.SCOPE.set_nr_avg(scope1;ch="1",navg=10)
# EnhanceRes
GI.SCOPE.set_eres(scope1;ch="1",bits="0.5b")
# Degauss
GI.SCOPE.degauss(scope1;ch="4",probe="CP030A")
# Clear sweeps
GI.SCOPE.clear_sweeps(scope1) # ??
# Nr of acquisition points
GI.SCOPE.set_nr_pts(scope1;npts=1e6)
# Sampling rate
GI.SCOPE.set_srate(scope1;sr=50e6)
# Acquisition duration
GI.SCOPE.set_hduration(scope1;d=1e-3)
# Horizontal offset origin
GI.SCOPE.set_hoffs_div(scope1;href=1)
# Set Measurement
GI.SCOPE.set_meas(scope1;ch="1",fct="max",par=1,vw=1)#not working, check VBS
# Get Measurement
GI.SCOPE.get_meas(scope1;par=1)
# Set trigger source
GI.SCOPE.set_trig_src(scope1;src="1")
# Set trigger type
GI.SCOPE.set_trig_type(scope1;tp="edge")
# Set trigger mode
GI.SCOPE.set_trig_mode(scope1;mode="single")
# Set trigger slope
GI.SCOPE.set_trig_slope(scope1;slp="pos")
# Set trigger level
GI.SCOPE.set_trig_lev(scope1;lev=1.2) #not working?
# Set trigger holdoff
GI.SCOPE.set_trig_holdoff(scope1;hf=1e-3)#not working?
# Trigger delay time
GI.SCOPE.set_hoffs_t(scope1;href=11e-3)
# Set trigger coupling
GI.SCOPE.set_trig_cpl(scope1;src="1",cpl="dc")
# BW limit
GI.SCOPE.set_bw_lim(scope1;ch="1",bw="full")
# Close
GI.SCOPE.disconnect!(scope1)
# pending...