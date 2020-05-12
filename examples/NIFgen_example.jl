using GenericInstruments
GI = GenericInstruments
####################################
# Instantiate obj
niFgen1 = GI.AWG.INSTR(:NI5421,"PXI1Slot2")
# Init
GI.AWG.connect!(niFgen1)
x=GI.AWG.get_idn(niFgen1)
GI.AWG.disconnect!(niFgen1)
# pending...