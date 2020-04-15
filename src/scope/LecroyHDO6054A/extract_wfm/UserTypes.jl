module UserTypes
include("FixedTypes.jl")
import .FixedTypes: Param, Out, Signal, Compression, MyData, @define_struct
@define_struct Params VI VRADJ
@define_struct Aux aux1
@define_struct Comment MyComment PicturePath
@define_struct Outs VQmean VQstd
@define_struct Signals vq vd vro vwo
export Param, Out, Signal, Compression,
	Params, Aux, Comment, Outs, Signals, MyData,
	@define_struct
end

#data    = MyData(param, aux, comment, out, wfm)