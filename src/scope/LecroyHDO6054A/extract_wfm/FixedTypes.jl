module FixedTypes
include("create_struct.jl")
@define_struct Param range value unit
@define_struct Out range value unit
@define_struct Compression compr_method detail_th compr_aux
@define_struct Signal y dt t compression
@define_struct MyData param aux comment out wfm
export Param, Out, Signal, Compression, MyData, @define_struct
end


