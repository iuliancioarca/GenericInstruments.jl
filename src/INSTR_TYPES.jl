# Instrument types
# PSU
E364x1 = Union{INSTR{:KeysightE3645A},
	INSTR{:AgilentE3645A}
	}
E364x2 = Union{INSTR{:KeysightE3646A},
	INSTR{:AgilentE3646A},
	INSTR{:KeysightE3649A},
	INSTR{:AgilentE3649A}
	}
					
# FGEN
F332x1 = Union{INSTR{:Agilent33250A}
	}
F335x2 = Union{INSTR{:Agilent33500B},
	INSTR{:Keysight33500B},
	INSTR{:Agilent33522A}
	}
	
# DMM
KE200x = Union{INSTR{:Keithley2000},
	INSTR{:KE2000},
	INSTR{:Keithley2001},
	INSTR{:KE2001},
	}
	
# SCOPE
LCR6xxx = Union{INSTR{:HDO6054A},
	INSTR{:HRO64zi}
	}