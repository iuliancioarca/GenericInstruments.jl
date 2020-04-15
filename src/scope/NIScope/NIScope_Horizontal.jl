NIScope_Horizontal_Dict = Dict()

# Nr of acquisition points
function set_nr_pts(scope::T;npts=1e6) where {T<:NIScope} 
	NISCOPE_ATTR_HORZ_MIN_NUM_PTS=1250009; # ((1000000 + 250000) + 9)
	status = niScope_SetAttributeViInt32(scope, "", NISCOPE_ATTR_HORZ_MIN_NUM_PTS, Int32(npts))
end
# Sampling rate
function set_srate(scope::T;sr=1e6) where {T<:NIScope} 
	NISCOPE_ATTR_MIN_SAMPLE_RATE=1150009; # ((1000000 + 150000) + 9)
	status = niScope_SetAttributeViReal64(scope, "", NISCOPE_ATTR_MIN_SAMPLE_RATE, Float64(sr))
end
# Acquisition duration
function set_hduration(scope::T;d=1e-3) where {T<:NIScope}
	error("not available yet")
end
# Horizontal offset origin
function set_hoffs_div(scope::T;href::Int=1) where {T<:NIScope}
	NISCOPE_ATTR_HORZ_RECORD_REF_POSITION=1250011; # ((1000000 + 250000) + 11)
	status = niScope_SetAttributeViReal64(scope, "", NISCOPE_ATTR_HORZ_RECORD_REF_POSITION, Float64(href*10))
end
