function extract_scope_wfm(scope, args...)
data = []
for ch in args
	x = (ch1, initial_x, x_increm) = GI.SCOPE.fetch_wfm(scope,ch)
	push!(data,x)
end
return data 
# can destructure this array automatically when calling the function
# ch1,ch2,ch3,ch4 = extract_scope_wfm(scope1, 1,2,3,4)
end
