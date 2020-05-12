## OUTPUT FUNCTION
# Duty Cycle for 33250A
set_duty(obj::INSTR{:Agilent33250A},ch="1",func="square",duty=0.01) = write(obj,"SOURce$ch:FUNC:square:DCYC $duty")

## BURST
# Burst on
set_burst_stat(obj::T;ch="1",st="off") where {T<:F332x1} = write(obj,"BURS:STAT $st")
# Burst mode
set_burst_mode(obj::T;ch="1",md="triggered") where {T<:F332x1} = write(obj,"BURS:MODE $md")
# Burst polarity
set_burst_pol(obj::T;ch="1",pol="normal") where {T<:F332x1} = write(obj,"BURS:GATE:POL $pol")
# Burst ncycles
set_burst_ncyc(obj::T;ch="1",nc=1) where {T<:F332x1} = write(obj,"BURS:NCYC $nc")
# Burst period
set_burst_per(obj::T;ch="1",per=0.01) where {T<:F332x1} = write(obj,"BURS:INT:PER $per")
# Burst phase
set_burst_phase(obj::T;ch="1",unit="deg",phase=0) where {T<:F332x1} = write(obj,"UNIT:ANGL $unit\n;BURS:PHAS $phase")

## TRIGGER
# Output trigger source
set_out_trig_sour(obj::T;sour=1) where {T<:F332x1} = write(obj,"OUTP:TRIG:SOUR ch$sour")













