using GenericInstruments
GI = GenericInstruments
####################################
resmgr = GI.viOpenDefaultRM()
# Instantiate obj
dmm1 = GI.DMM.INSTR(:KE2000, "GPIB0::4::INSTR")
GI.DMM.connect!(resmgr, dmm1)
# Reset
GI.DMM.reset_instr(dmm1)
# Clear
GI.DMM.clear_instr(dmm1)
# IDN
GI.DMM.get_idn(dmm1)
# Function
GI.DMM.set_fc(dmm1,fc="VOLT:DC")
# Function and range
GI.DMM.set_fc_range(dmm1,fc="VOLT",rn=10)
GI.DMM.set_fc_range_auto(dmm1,fc="VOLT")
# Function and NPLC
GI.DMM.set_fc_nplc(dmm1,fc="VOLT",nplc=2)
# Init once
GI.DMM.init_meas(dmm1)
# Init continuous
GI.DMM.init_meas_continuous(dmm1,st="ON")
# Abort
#GI.DMM.abort_meas(dmm1)
# Read measurement
y = GI.DMM.read_meas(dmm1)
# Disconnect
GI.DMM.disconnect!(dmm1)
