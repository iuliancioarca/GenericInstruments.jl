LCR6xxx_Vertical_Dict = Dict()
# Channel enabled
LCR6xxx_Vertical_Dict["on"]  = "on"
# Channel coupling
LCR6xxx_Vertical_Dict["ac"]  = 0
LCR6xxx_Vertical_Dict["dc"]  = 1
LCR6xxx_Vertical_Dict["gnd"] = 2
# Probe attenuation
LCR6xxx_Vertical_Dict["10x"] = 10
# BW limit
LCR6xxx_Vertical_Dict["full"]   = 0
LCR6xxx_Vertical_Dict["200MHz"] = 1
LCR6xxx_Vertical_Dict["20MHz"]  = 2
# EnhanceRes
LCR6xxx_Vertical_Dict["0b"]   = 0
LCR6xxx_Vertical_Dict["0.5b"] = 1
LCR6xxx_Vertical_Dict["1b"]   = 2
LCR6xxx_Vertical_Dict["1.5b"] = 3
LCR6xxx_Vertical_Dict["2b"]   = 4
LCR6xxx_Vertical_Dict["2.5b"] = 5
LCR6xxx_Vertical_Dict["3b"]   = 6

# Channel enabled
function set_state(scope::T;ch::String="1",st::String="on") where {T<:LCR6xxx}
	st = LCR6xxx_Vertical_Dict[st]
	write(scope.obj,"VBS app.Acquisition.C$ch.View=$st")
end
# Channel input impedance
function set_input_impedance(scope::T;ch::String="1",val::String="1M") where {T<:LCR6xxx}
	#st = LCR6xxx_Vertical_Dict[st]
	#write(scope.obj,"VBS app.Acquisition.C$ch.View=$st")????
end
# Channel coupling
function set_coupling(scope::T;ch::String="1",cpl::String="dc") where {T<:LCR6xxx}
	cpl = LCR6xxx_Vertical_Dict[cpl]
	write(scope.obj,"VBS app.Acquisition.C$ch.Coupling=$cpl")
end
# Probe attenuation
function set_atten(scope::T;ch::String="1",att::String="10x") where {T<:LCR6xxx}
	att = LCR6xxx_Vertical_Dict[att]
	write(scope.obj,"VBS app.Acquisition.C$ch.ProbeAttenuation=$att")
end
# BW limit
function set_bw_lim(scope::T;ch::String="1",bw::String="full") where {T<:LCR6xxx}
	bw = LCR6xxx_Vertical_Dict[bw]
	write(scope.obj,"VBS app.Acquisition.C$ch.BandwidthLimit=$bw")
end
# Nr of averages
function set_nr_avg(scope::T;ch::String="1",navg::Int=1) where {T<:LCR6xxx}
	write(scope.obj,"VBS app.Acquisition.C$ch.AverageSweeps=$navg")
end
# EnhanceRes
function set_eres(scope::T;ch::String="1",bits::String="0b") where {T<:LCR6xxx}
	bits = LCR6xxx_Vertical_Dict[bits]
	write(scope.obj,"VBS app.Acquisition.C$ch.EnhanceResType=$bits")
end
# Degauss
function degauss(scope::T;ch::String="1",probe::String="CP030A") where {T<:LCR6xxx}
	write(scope.obj,"VBS app.Acquisition.C$ch.InputB.$probe.Degauss")
end
# Vertical range
function set_vrange(scope::T;ch::String="1",vrang=8) where {T<:LCR6xxx}
	write(scope.obj,"VBS app.Acquisition.C$ch.VerScale=$(vrang/8)")
end
# Vertical scale (V/div)
function set_vscale(scope::T;ch::String="1",volt=8) where {T<:LCR6xxx}
	write(scope.obj,"VBS app.Acquisition.C$ch.VerScale=$volt")
end
# Vertical offset
function set_voffs(scope::T;ch::String="1",voffs=0) where {T<:LCR6xxx}
	write(scope.obj,"VBS app.Acquisition.C$ch.VerOffset=$voffs")
end
