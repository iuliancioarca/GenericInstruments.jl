# hack until we figure out how to detect automatically
if Sys.iswindows()
	const libniscope = "C:/Program Files/IVI Foundation/IVI/Bin/niScope_64"
	const libnidmm   = "C:/Program Files/IVI Foundation/IVI/Bin/nidmm_64"
	const libnifgen  = "C:/Program Files/IVI Foundation/IVI/Bin/niFgen_64"
	const libnihsdio = "C:/Program Files/IVI Foundation/IVI/Bin/niHSDIO_64"
	const libvisa    = "C:/Windows/System32/visa64"
elseif Sys.islinux()
	@error "Please add the lib paths manually and rebuild the package!"
	const libniscope = ""
	const libnidmm = ""
	const libnifgen = ""
	const libnihsdio = ""
	const libvisa = ""
elseif Sys.isapple()
	@error "Please add the lib paths manually and rebuild the package!"
	const libniscope = ""
	const libnidmm = ""
	const libnifgen = ""
	const libnihsdio = ""
	const libvisa = ""
elseif Sys.isunix()
	@error "Please add the lib paths manually and rebuild the package!"
	const libniscope = ""
	const libnidmm = ""
	const libnifgen = ""
	const libnihsdio = ""
	const libvisa = ""
end
