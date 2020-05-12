using GenericInstruments
GI = GenericInstruments
####################################
# Instantiate obj
niDmm1 = GI.DMM.INSTR(:NI4071,"PXI1Slot5")
# Init
GI.DMM.connect!(niDmm1)
GI.DMM.get_idn(niDmm1)
GI.DMM.disconnect!(niDmm1)

# pending...