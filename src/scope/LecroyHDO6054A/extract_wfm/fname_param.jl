function fname_param(testunit_name,param,ext=".mat")
#"Test_VI=-1[V]_VRADJ=0[V].mat"
pnames = fieldnames(typeof(param))
param_names = ""
for pname in pnames
	aux  = getfield(param,pname)
	name = string(pname)
	val  = string(aux.value)
	unit = string(aux.unit)
	param_names = param_names*"_"*name*"="*val*"["*unit*"]"
end
fname = testunit_name*param_names*ext
end
