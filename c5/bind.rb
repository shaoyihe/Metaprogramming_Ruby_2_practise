test1 = "here"
def find_local_var
	test2 =  "there"
	binding
end

p local_variables
p find_local_var.eval(" local_variables ")