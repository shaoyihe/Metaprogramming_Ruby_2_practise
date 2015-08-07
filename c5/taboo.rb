# class MyClass < Array
# 	def my_method
# 		'Hello!'
# 	end
# end


MyClass =Class.new(Array) do
	def my_method
		"Hello"
	end
end

p MyClass.ancestors()
p MyClass.new.my_method