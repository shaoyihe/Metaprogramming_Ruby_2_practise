class MyClass
	@my = "some"
end

p MyClass.instance_variables

c1 =MyClass.new
c2 = MyClass.new
c2.instance_variable_set("@test",[])	
p c1.instance_variables
p c2.instance_variables