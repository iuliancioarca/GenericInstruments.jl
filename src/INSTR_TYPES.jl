# Generic instrument struct
abstract type Instrument end

mutable struct INSTR{instr_name} <: Instrument
    name::Symbol
    address::String
    handle# this needs to be anything, to accept PXI instruments
	initialized::Bool
	bufSize::UInt32
end
# Generic instrument constructor
INSTR(instr_name, address) = INSTR{instr_name}(instr_name, address, 0, false,UInt32(1024))

##############################################
# PSU
E364x1 = Union{INSTR{:KeysightE3645A},
	INSTR{:AgilentE3645A}
	}
E364x2 = Union{INSTR{:KeysightE3646A},
	INSTR{:AgilentE3646A},
	INSTR{:KeysightE3649A},
	INSTR{:AgilentE3649A}
	}
	
##############################################					
# AWG
F332x1 = Union{INSTR{:Agilent33250A}
	}
F335x2 = Union{INSTR{:Agilent33500B},
	INSTR{:Keysight33500B},
	INSTR{:Agilent33522A}
	}
NIFgen = Union{INSTR{:NI5421},
	INSTR{:NI5422}
	}
	
##############################################
# DMM
KE200x = Union{INSTR{:Keithley2000},
	INSTR{:KE2000},
	INSTR{:Keithley2001},
	INSTR{:KE2001},
	}
NIDmm = Union{INSTR{:NI4071}
	}
	
##############################################
# Lecroy SCOPE
LCR6xxx = Union{INSTR{:HDO6054A},
	INSTR{:HRO64zi}
	}
# NI PXI SCOPE
NIScope = Union{INSTR{:NI5122},
			INSTR{:NI5114},
			INSTR{:NI5152},
			}


