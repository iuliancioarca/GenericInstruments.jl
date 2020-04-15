cd(raw"C:\Iulian\Julia_Instrument_Drivers\v0.31\GenericInstruments.jl-master\src")
include("GenericInstruments.jl")
using .GenericInstruments
const GI = GenericInstruments

using Plots, MAT

include("UserTypes.jl")
import .UserTypes: Param, Out, Signal, Compression,
	Params, Aux, Comment, Outs, Signals, MyData,
	@define_struct
	
include("fname_param.jl")
include("extract_scope_wfm.jl")
####################################
# Instantiate obj
rm   = GI.ResourceManager()
scope1 = GI.SCOPE.INSTR(:HDO6054A, "USB0::0x05FF::0x1023::4066N51752::INSTR")
GI.SCOPE.set_instr_state!(rm, scope1; act = GI.connect!)
# IDN
GI.SCOPE.get_idn(scope1)
# Fetch waveform from channels
vq,vd,vro,vwo = extract_scope_wfm(scope1, 1,2,3,4)
# Disconnect everything
GI.SCOPE.set_instr_state!(rm, scope1; act = GI.disconnect!)

x_increm = vq[3]
t = collect(0.0:x_increm:(length(vq[1])-1)*x_increm)

VI    = Param([],-1,"V")
VRADJ = Param([],0,"V")
param = Params(VI,VRADJ)

aux = Aux("")
comment = Comment("","")

VQmean = Out([],5,"V")
VQstd = Out([],7,"mV")
out = Outs(VQmean,VQstd)

compr = Compression(0, 0, 0)

vq  = Signal(vq[1], x_increm, t, compr)
vd  = Signal(vd[1], x_increm, t, compr)
vro = Signal(vro[1], x_increm, t, compr)
vwo = Signal(vwo[1], x_increm, t, compr)

wfm = Signals(vq,vd,vro,vwo)

data = MyData(param, aux, comment, out, wfm)
# -> structure is preserved in Matlab:)
# use [] to emulate the cell array
# file name according to LV124BrowserV2 requirements
mat_name = fname_param("Reset_Diagram",param)
matwrite(mat_name, Dict("data" =>[data]); compress = true) 