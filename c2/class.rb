class MyClass
end

c1 =MyClass.new
c2 = MyClass.new

def c2.test
	p "#{self} : #{__method__}"
end

p c1.methods(false)
p c2.methods(false)
c2.test