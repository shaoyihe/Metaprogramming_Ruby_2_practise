require_relative("check")

class Person
	include CheckedAttributes2

	attr_checked :age do |v|
		v >= 18
	end
end

p Person.singleton_methods
p CheckedAttributes2.singleton_methods

me = Person.new
me.age = 39 # OK
p me.age

me.age = 22 # Exception
p me