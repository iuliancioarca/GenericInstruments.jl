using GenericInstruments
GI = GenericInstruments
####################################
resmgr = GI.viOpenDefaultRM()
# Instantiate obj
awg1 = GI.AWG.INSTR(:Agilent33500B, "USB0::0x0957::0x2C07::MY52803073::INSTR")
GI.AWG.connect!(resmgr, awg1)
# IDN
GI.AWG.get_idn(awg1)
#or
GI.AWG.query(awg1,"*IDN?")

# Reset
GI.AWG.reset_instr(awg1)
# Output load INF
GI.AWG.set_load(awg1,ch="1",load="INF")
# Wfm
GI.AWG.set_wfm(awg1,ch="1",func="square")
# Amplitude
GI.AWG.set_amplit(awg1,ch="1",unit="vpp",volt=1)
# Offset
GI.AWG.set_offs(awg1,ch="1",volt=0.4)
# High level
GI.AWG.set_hilev(awg1,ch="1",volt=3)
# Low level
GI.AWG.set_lolev(awg1,ch="1",volt=1)
# Duty cycle
GI.AWG.set_duty(awg1,ch="1",func="square",duty=22)
# Arbitrary waveform
GI.AWG.clear_arbs(awg1,ch="1")
wfm = Float32.([0,0, 0,1, 1,1,1,-1,-1,-1,-1,-1,1,1,1, 0, 0,0,0,0]) # normed to -1:1
GI.AWG.send_arb(awg1,ch="1",wfm=wfm,dt=1e-7,arb="mywfm")
GI.AWG.set_wfm(awg1,ch="1",func="ARB")
GI.AWG.set_arb_wfm(awg1,ch="1",arb="mywfm")
GI.AWG.set_burst_stat(awg1,ch="1",st="on")
GI.AWG.set_trig_sour(awg1,ch="1",sour="BUS")
GI.AWG.set_outp(awg1,ch="1",st="on")
GI.AWG.send_soft_trig(awg1)

GI.AWG.reset_instr(awg1)

GI.AWG.disconnect!(awg1)
# pending...