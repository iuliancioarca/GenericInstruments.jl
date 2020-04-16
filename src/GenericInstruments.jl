module GenericInstruments
using Pkg
if haskey(Pkg.installed(),"Instruments")
	using Instruments
	import Instruments: ResourceManager, GenericInstrument, connect!, disconnect!, write, read, query
else
@info "Installing unregistered package Instruments.jl for low level VISA communication"
Pkg.add(PackageSpec(url="https://github.com/BBN-Q/Instruments.jl.git"))
end
# common instr containers, connect/disconnect methods
include("INSTR_TYPES.jl")
include("comm_utils.jl")
# instruments
include("psu\\PSU.jl")
include("awg\\AWG.jl")
include("scope\\SCOPE.jl")
include("dmm\\DMM.jl")

using .PSU
using .AWG
using .SCOPE
using .DMM

end #endmodule
