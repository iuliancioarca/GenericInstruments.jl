using GenericInstruments
GI = GenericInstruments
####################################
# Instantiate obj
resmgr   = GI.viOpenDefaultRM()
psu1 = GI.PSU.INSTR(:KeysightE3645A, "GPIB0::5::INSTR")#single ch psu
psu2 = GI.PSU.INSTR(:AgilentE3646A, "GPIB0::6::INSTR")#dual ch psu
####################################
# USAGE
####################################
# Power supply
GI.PSU.connect!(resmgr,psu1)
GI.PSU.connect!(resmgr,psu2)
# IDN
GI.PSU.get_idn(psu1)
GI.PSU.get_idn(psu2)
# Reset
GI.PSU.reset_instr(psu1)
GI.PSU.reset_instr(psu2)
# Set range
GI.PSU.set_range(psu1,ch="1",vrang="low")
GI.PSU.set_range(psu2,ch="1",vrang="high")
# Set voltage
GI.PSU.set_volt(psu1,ch="1",volt=5)
GI.PSU.set_volt(psu2,ch="1",volt=3)
# Set current compliance
GI.PSU.set_compl(psu1,ch="1",crtlim=0.6)
GI.PSU.set_compl(psu2,ch="1",crtlim=1.1)
# Output on/off
GI.PSU.set_outp(psu1,ch="1",st="on")
GI.PSU.set_outp(psu2,ch="1",st="on")
# Disconnect everything
GI.PSU.disconnect!(psu1)
GI.PSU.disconnect!(psu2)