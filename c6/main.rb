require_relative("check")

class Person
	extend CheckedAttributes

	attr_checked :age do |v|
		v >= 18
	end
end


me = Person.new
me.age = 39 # OK
p me.age

me.age = 22 # Exception
p me