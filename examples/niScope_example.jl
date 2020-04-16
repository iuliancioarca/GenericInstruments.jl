using GenericInstruments
const GI = GenericInstruments
####################################
# Instantiate obj
niScope1 = GI.SCOPE.INSTR(:NI5122,"PXI1Slot3")

# Init
#GI.SCOPE.set_instr_state!(resmgr, niScope1; act = GI.SCOPE.connect!) # not wotking yet
GI.SCOPE.niScope_init(niScope1)
# Auto setup
GI.SCOPE.niScope_AutoSetup(niScope1)

### User defined low_level
# Channel coupling
GI.SCOPE.set_coupling(niScope1;ch="1",cpl="gnd")
GI.SCOPE.niScope_GetAttributeViInt32(niScope1, "0", 1250003) # OK
# Channel state on/off
GI.SCOPE.set_state(niScope1;ch="1",st="on")
GI.SCOPE.niScope_GetAttributeViBoolean(niScope1, "0", 1250005) #OK
# Probe attenuation
GI.SCOPE.set_atten(niScope1;ch="1",att="10x")
GI.SCOPE.niScope_GetAttributeViReal64(niScope1, "0", 1250004) # always returns 1.0!!!
# BW limit
GI.SCOPE.set_bw_lim(niScope1;ch="1",bw="100MHz")
GI.SCOPE.niScope_GetAttributeViReal64(niScope1, "0", 1250006) #OK
## VERTICAL
# Vrange
GI.SCOPE.set_vrange(niScope1;ch="1",vrang=2.2)
GI.SCOPE.niScope_GetAttributeViReal64(niScope1, "0", 1250001) #OK, it approximates to next value
# Vertical offset
GI.SCOPE.set_voffs(niScope1;ch="1",voffs=0.12)
GI.SCOPE.niScope_GetAttributeViReal64(niScope1, "0", 1250002) #OK
## HORIZONTAL
# Nr of acquisition points 
GI.SCOPE.set_nr_pts(niScope1;npts=1.3e6)
GI.SCOPE.niScope_GetAttributeViInt32(niScope1, "", 1250009) #OK
# Sampling rate
GI.SCOPE.set_srate(niScope1;sr=1.6e6) # take care, this is min sample rate, not actual sample rate
GI.SCOPE.niScope_GetAttributeViReal64(niScope1, "", 1150009) #OK, min sample rate
GI.SCOPE.niScope_GetAttributeViReal64(niScope1, "", 1250010) #OK, actual sample rate:1.6129032258064516e6
# Horizontal offset origin in #divisions
GI.SCOPE.set_hoffs_div(niScope1;href=1) # actually sends 1*10 = 10%
GI.SCOPE.niScope_GetAttributeViReal64(niScope1, "", 1250011) #OK, returns 1*10 = 10%
## TRIGGER
# Set trigger type
GI.SCOPE.set_trig_type(niScope1;tp="edge")
GI.SCOPE.niScope_GetAttributeViInt32(niScope1, "", 1250012) #OK, find triggertype enum!
# Set trigger source
GI.SCOPE.set_trig_src(niScope1;src="1") #can be channel:"0" or "ext", etc. check enum
GI.SCOPE.niScope_GetAttributeViString(niScope1, "", 1250013) #OK
# Set trigger slope
GI.SCOPE.set_trig_slope(niScope1;slp=1)
GI.SCOPE.niScope_GetAttributeViInt32(niScope1, "", 1250018) # always returns 1!!!
# Set trigger level
GI.SCOPE.set_trig_lev(niScope1;lev=1.15)
GI.SCOPE.niScope_GetAttributeViReal64(niScope1, "", 1250017) #OK? 1.1485451761102603
# Set trigger holdoff
GI.SCOPE.set_trig_holdoff(niScope1;hf=120e-9)
GI.SCOPE.niScope_GetAttributeViReal64(niScope1, "", 1250016) #OK
# Trigger delay time
GI.SCOPE.set_hoffs_t(niScope1;href=1.2e-3)
GI.SCOPE.niScope_GetAttributeViReal64(niScope1, "", 1250015) #OK
# Set trigger coupling
GI.SCOPE.set_trig_cpl(niScope1;ch="1",cpl="ac")
GI.SCOPE.niScope_GetAttributeViInt32(niScope1, "", 1250014) #always returns 0

# Built-in high level functions
GI.SCOPE.niScope_ConfigureVertical(niScope1,
	ch=0,vrang=5.0,voffs=0.5,cpl=Int32(1),att=1.0,st=Int16(1))
GI.SCOPE.niScope_ConfigureHorizontalTiming(niScope1,
minSampleRate=2e5,minNumPts=1000,refPosition=0.1,numRecords=1,enforceRealtime=1)
GI.SCOPE.niScope_ConfigureTriggerImmediate(niScope1)
GI.SCOPE.niScope_InitiateAcquisition(niScope1)
GI.SCOPE.niScope_ActualRecordLength(niScope1)
y,info = GI.SCOPE.fetch_wfm(niScope1,ch="1")
plot(y)

# Close
GI.SCOPE.niScope_close(niScope1)