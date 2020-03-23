## NISCOPE user high level functions
###################################################################################
### WRAPPERS OVER GET/SET ATTRIBUTES


## CHANNEL
# Channel coupling
#NISCOPE_VAL_AC (0)
#NISCOPE_VAL_DC (1)
#NISCOPE_VAL_GND(2)
function set_coupling(scope::T;ch::String="1",cpl::Int=1) where {T<:NISCOPE}
	NISCOPE_ATTR_VERTICAL_COUPLING = 1250003; # ((1000000 + 250000) + 3)
	status = niScope_SetAttributeViInt32(scope, ch, NISCOPE_ATTR_VERTICAL_COUPLING, cpl)
end

# Channel enabled
#VI_TRUE (1)— Acquire data on this channel.
#VI_FALSE(0)— Do not acquire data on this channel.
function set_ch_state(scope::T;ch::String="1",st::String="on") where {T<:NISCOPE}
	NISCOPE_ATTR_CHANNEL_ENABLED=1250005; # ((1000000 + 250000) + 5)
	st=="on" ? val=true : val=false
	status = niScope_SetAttributeViBoolean(scope, ch, NISCOPE_ATTR_CHANNEL_ENABLED, val)
end

# Probe attenuation
#Valid Values: Any positive real number. Typical values are 1, 10, and 100.
function set_atten(scope::T;ch::String="1",att=10) where {T<:NISCOPE}
	NISCOPE_ATTR_PROBE_ATTENUATION=1250004; # ((1000000 + 250000) + 4)
	status = niScope_SetAttributeViReal64(scope, ch, NISCOPE_ATTR_PROBE_ATTENUATION, Float64(att))
end

# BW limit
#NISCOPE_VAL_BANDWIDTH_FULL (–1.0)
#NISCOPE_VAL_BANDWIDTH_DEVICE_DEFAULT (0.0)
#NISCOPE_VAL_20MHZ_BANDWIDTH (20000000.0)
#NISCOPE_VAL_100MHZ_BANDWIDTH (100000000.0)
#NISCOPE_VAL_20MHZ_MAX_INPUT_FREQUENCY (20000000.0)
#NISCOPE_VAL_100MHZ_MAX_INPUT_FREQUENCY (100000000.0)
function set_bw_lim(scope::T;ch::String="1",bw=0) where {T<:NISCOPE}
	NISCOPE_ATTR_MAX_INPUT_FREQUENCY=1250006; # ((1000000 + 250000) + 6)
	status = niScope_SetAttributeViReal64(scope, ch, NISCOPE_ATTR_MAX_INPUT_FREQUENCY, Float64(bw))
end


## VERTICAL
# Vertical range
#to acquire a sine wave that spans between –5 and +5 V, set this attribute to 10.0 V. 
function set_vrange(scope::T;ch::String="1",vrang=8) where {T<:NISCOPE}
	NISCOPE_ATTR_VERTICAL_RANGE=1250001; # ((1000000 + 250000) + 1)
	status = niScope_SetAttributeViReal64(scope, ch, NISCOPE_ATTR_VERTICAL_RANGE, Float64(vrang))
end

# Vertical offset
#to acquire a sine wave that spans between 0.0 and 10.0 V, set this attribute to 5.0 V.
function set_voffs(scope::T;ch::String="1",voffs=0) where {T<:NISCOPE}
	NISCOPE_ATTR_VERTICAL_OFFSET=1250002; # ((1000000 + 250000) + 2)
	status = niScope_SetAttributeViReal64(scope, ch, NISCOPE_ATTR_VERTICAL_OFFSET, Float64(voffs))
end


## HORIZONTAL
# Nr of acquisition points 
function set_nr_pts(scope::T;npts=1e6) where {T<:NISCOPE}
	NISCOPE_ATTR_HORZ_MIN_NUM_PTS=1250009; # ((1000000 + 250000) + 9)
	status = niScope_SetAttributeViInt32(scope, ch, NISCOPE_ATTR_HORZ_MIN_NUM_PTS, Int32(npts))
end

# Sampling rate
function set_srate(scope::T;sr=1e6) where {T<:NISCOPE}
	NISCOPE_ATTR_MIN_SAMPLE_RATE=1150009; # ((1000000 + 150000) + 9)
	status = niScope_SetAttributeViReal64(scope, ch, NISCOPE_ATTR_MIN_SAMPLE_RATE, Float64(sr))
end

# Horizontal offset origin
#value 50.0 corresponds to the center of the waveform record and 0.0 corresponds to the first element in the waveform record.
#Valid Values: 0.0 – 100.0
function set_hoffs_div(scope::T;href::Int=1) where {T<:NISCOPE}
	NISCOPE_ATTR_HORZ_RECORD_REF_POSITION=1250011; # ((1000000 + 250000) + 11)
	status = niScope_SetAttributeViReal64(scope, ch, NISCOPE_ATTR_HORZ_RECORD_REF_POSITION, Float64(href*10))
end


## TRIGGER
# Set trigger type
function set_trig_typ(scope::T;tp::Int=0) where {T<:NISCOPE}
	NISCOPE_ATTR_TRIGGER_TYPE=1250012; # ((1000000 + 250000) + 12)
	status = niScope_SetAttributeViInt32(scope, ch, NISCOPE_ATTR_TRIGGER_TYPE, Int32(tp))
end

# Set trigger source
function set_trig_src(scope::T;ch::String="1",val) where {T<:NISCOPE}
	NISCOPE_ATTR_TRIGGER_SOURCE=1250013; # ((1000000 + 250000) + 13)
	status = niScope_SetAttributeViString(scope::T, ch="", NISCOPE_ATTR_TRIGGER_SOURCE, val)
end

# Set trigger slope
function set_trig_slope(scope::T;slp::Int=0) where {T<:NISCOPE}
	NISCOPE_ATTR_TRIGGER_SLOPE=1250018; # ((1000000 + 250000) + 18)
	status = niScope_SetAttributeViString(scope::T, ch="", NISCOPE_ATTR_TRIGGER_SLOPE, Int32(slp))
end

# Set trigger level
function set_trig_lev(scope::T;lev=1) where {T<:NISCOPE}
	NISCOPE_ATTR_TRIGGER_LEVEL=1250017; # ((1000000 + 250000) + 17)
	status = niScope_SetAttributeViReal64(scope, ch, NISCOPE_ATTR_TRIGGER_LEVEL, Float64(lev))
end

# Set trigger holdoff
function set_trig_holdoff(scope::T;hf=1e-9) where {T<:NISCOPE}
	NISCOPE_ATTR_TRIGGER_HOLDOFF=1250016; # ((1000000 + 250000) + 16)
	status = niScope_SetAttributeViReal64(scope, ch, NISCOPE_ATTR_TRIGGER_HOLDOFF, Float64(hf))
end

# Trigger delay time
function set_hoffs_t(scope::T;href=1e-3) where {T<:NISCOPE}
	NISCOPE_ATTR_TRIGGER_DELAY_TIME=1250015; # ((1000000 + 250000) + 15)
	status = niScope_SetAttributeViReal64(scope, ch, NISCOPE_ATTR_TRIGGER_DELAY_TIME, Float64(href))
end

# Set trigger coupling
function set_trig_cpl(scope::T;ch::String="1",cpl::Int=0) where {T<:NISCOPE}
	NISCOPE_ATTR_TRIGGER_COUPLING=1250014; # ((1000000 + 250000) + 14)
	status = niScope_SetAttributeViInt32(scope, ch, NISCOPE_ATTR_TRIGGER_COUPLING, Int32(cpl))
end


















