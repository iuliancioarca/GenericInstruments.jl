LCR6xxx_Vertical_Dict = Dict()
# Channel enabled
LCR6xxx_Vertical_Dict["on"]  = 1
LCR6xxx_Vertical_Dict["off"] = 0
# Channel coupling
LCR6xxx_Vertical_Dict["dc50"] = 0
LCR6xxx_Vertical_Dict["gnd"]  = 1
LCR6xxx_Vertical_Dict["dc"] = 2
LCR6xxx_Vertical_Dict["ac"] = 3
# Probe attenuation
LCR6xxx_Vertical_Dict["1x"] = 1
LCR6xxx_Vertical_Dict["10x"] = 10
LCR6xxx_Vertical_Dict["100x"] = 100
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
function set_state(obj::T;ch::String="1",st::String="on") where {T<:LCR6xxx}
	st = LCR6xxx_Vertical_Dict[st]
	write(obj,"VBS app.Acquisition.C$ch.View=$st")
end
# Channel input impedance
#function set_input_impedance(obj::T;ch::String="1",val::String="1M") where {T<:LCR6xxx}
#	st = LCR6xxx_Vertical_Dict[st]
#	write(obj,"VBS app.Acquisition.C$ch.View=$st")
#end
# Channel coupling
function set_coupling(obj::T;ch::String="1",cpl::String="dc") where {T<:LCR6xxx}
	cpl = LCR6xxx_Vertical_Dict[cpl]
	write(obj,"VBS app.Acquisition.C$ch.Coupling=$cpl")
end
# Probe attenuation
function set_atten(obj::T;ch::String="1",att::String="10x") where {T<:LCR6xxx}
	att = LCR6xxx_Vertical_Dict[att]
	write(obj,"VBS app.Acquisition.C$ch.ProbeAttenuation = $att")
end
# BW limit
function set_bw_lim(obj::T;ch::String="1",bw::String="full") where {T<:LCR6xxx}
	bw = LCR6xxx_Vertical_Dict[bw]
	write(obj,"VBS app.Acquisition.C$ch.BandwidthLimit=$bw")
end
# Nr of averages
function set_nr_avg(obj::T;ch::String="1",navg::Int=1) where {T<:LCR6xxx}
	write(obj,"VBS app.Acquisition.C$ch.AverageSweeps=$navg")
end
# EnhanceRes
function set_eres(obj::T;ch::String="1",bits::String="0b") where {T<:LCR6xxx}
	bits = LCR6xxx_Vertical_Dict[bits]
	write(obj,"VBS app.Acquisition.C$ch.EnhanceResType=$bits")
end
# Degauss
function degauss(obj::T;ch::String="1",probe::String="CP030A") where {T<:LCR6xxx}
	write(obj,"VBS app.Acquisition.C$ch.InputB.$probe.Degauss")
end
# Vertical range
function set_vrange(obj::T;ch::String="1",vrang=8) where {T<:LCR6xxx}
	write(obj,"VBS app.Acquisition.C$ch.VerScale=$(vrang/8)")
end
# Vertical scale (V/div)
function set_vscale(obj::T;ch::String="1",volt=8) where {T<:LCR6xxx}
	write(obj,"VBS app.Acquisition.C$ch.VerScale=$volt")
end
# Vertical offset
function set_voffs(obj::T;ch::String="1",voffs=0) where {T<:LCR6xxx}
	write(obj,"VBS app.Acquisition.C$ch.VerOffset=$voffs")
end
