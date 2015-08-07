module MyModule
	def my_method
		"hello"
	end
end

class MyClass
	include MyModule
end

myClass =MyClass.new
p myClass.my_method()
p MyClass.ancestors
p MyClass.instance_methods.grep(/my/)

p MyClass.respond_to?(:my_method)

p "*" * 100

class MyClass2
	class <<self
		include MyModule
	end
end

p MyClass2.respond_to?(:my_method)
p MyClass2.my_method

myClass2 =MyClass.new

p "*" * 100
class MyClass3
end

MyClass3.class_exec{include MyModule}

p MyClass3.respond_to?(:my_method)
p MyClass3.new.respond_to?(:my_method)