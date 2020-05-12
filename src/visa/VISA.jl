# Full Wrapper over NIVISA, api and constants
# don't make visa a module since it needs to export all constants and error messages into other instrument modules
include("ctypes.jl")
include("visa_common.jl")
include("visa_errors.jl")
include("visa_api.jl")
include("visa_utils.jl")
include("Ivi_common.jl")

