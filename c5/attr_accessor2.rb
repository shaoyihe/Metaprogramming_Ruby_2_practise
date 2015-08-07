# def Module.attr_accessor2(*sym)
# 	sym.each do |sym|
# 		instance_eval(sym.to_s) do
# 			define_method(sym){instance_variable_get(sym)}
# 			define_method((sym.to_s+"=").to_sym) do|*parm|
# 				instance_variable_set(sym,parm)
# 			end
# 		end
# 	end
# end

# Class.class_exec(Class) do
# 	def attr_accessor2 *sym
# 		sym.each do |sym|
# 			instance_eval(sym.to_s) do
# 				define_method(sym){instance_variable_get(sym)}
# 				define_method((sym.to_s+"=").to_sym) do|*parm|
# 					instance_variable_set(sym,parm)
# 				end
# 			end
# 		end
# 	end
# end

class MyClass
	def self.attr_accessor2(*sym)
		sym.each do |sym|
			define_method(sym){instance_variable_get("@"+sym.to_s)}
			define_method((sym.to_s+"=").to_sym) do|*parm|
				instance_variable_set("@"+sym.to_s,parm)
			end
		end
	end

	attr_accessor2 :location
end

# p MyClass.singleton_methods
# p Class.singleton_methods
# p MyClass

myClass =MyClass.new
myClass.location = 2 ,2
p myClass.location
p myClass.methods.grep(/loc/)