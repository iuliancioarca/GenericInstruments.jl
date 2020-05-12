# DON'T USE!!! Just for visualisation
## PARAMS
mutable struct Param
	# don't modify
	range
	value
	unit::String
end
Param() = Param([],0,"")

mutable struct Params
	# variable number, add your own but keep the struct name as Params!
	# contains items of type Param
	#layers
    #Params(layers...) = new(layers)
	temp::Param
	CI::Param
	CQ::Param
	IQ::Param
	VI::Param
	VQtyp::Param
end

## AUX
mutable struct Aux
	# variable number, add your own but keep the struct name as Params!
	# contains items of type Param or Out
	aux1
end

## COMMENTS
mutable struct Comment
	# don't modify
	MyComment
	PicturePath
end

## OUTS
mutable struct Out
	# don't modify
	range
	value
	unit::String
end

mutable struct Outs
	# variable number, add your own but keep the struct name as Outs!
	# contains items of type Out
	DVline::Out
	DVload::Out
	VQmax::Out
	VQmin::Out
	VQmean::Out
	VQstd::Out
end

## WAVEFORMS
mutable struct Signal
	y
	dt
	t
end

mutable struct Signals
	vi::Signal
	vq::Signal
end

## TOP LEVEL
mutable struct MyData
	param::Params
	aux::Aux
	comment::Comment
	out::Outs
	wfm::Signals
end
MyData(x::Signals) = MyData(Params(Param()),) 



# OR use a macro and be done with it. basic example


# First layer
# Params
temp    = Param([25,150], 25, "C")
CI    	= Param([1], 1, "uF")
CQ    	= Param([1], 1, "uF")
IQ    	= Param([1,10,100], 1, "mA")
VI      = Param([6,8,10], 8, "V")
VQtyp   = Param([3.3,5], 5, "V")
# Outs
DVline  = Out([], 0, "mV")
DVload  = Out([], 0, "mV")
VQmax   = Out([], 0, "V")
VQmin   = Out([], 0, "m")
VQmean  = Out([], 0, "V")
VQstd   = Out([], 0, "mV")
# Waveforms
vi      = Signal(ch1, dt, t)
vq      = Signal(ch2, dt, t)
# Second layer
param   = Params(temp, CI, CQ, IQ, VI, VQtyp)
aux     = Aux("")
comment = Comment("", "")
out     = Outs(DVline, DVload, VQmax, VQmin, VQmean, VQstd)
wfm     = Signals(vi, vq)
# Third layer
data    = MyData(param, aux, comment, out, wfm)


