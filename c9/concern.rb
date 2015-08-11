require 'active_support'

module MyConcern2
	extend ActiveSupport::Concern

	def an_instance_method2; "an instance method"; end

	module ClassMethods
		def a_class_method2; "a class method"; end
	end
end

module MyConcern
	extend ActiveSupport::Concern

	def an_instance_method;
			"an instance method";
	end

	module ClassMethods
		def a_class_method; "a class method"; end
	end

	include MyConcern2
end	


class MyClass
	include MyConcern
end	

p MyClass.singleton_methods
p MyClass.instance_methods.grep(/instance_method/)
p MyConcern.singleton_methods
p MyConcern.instance_methods
p ActiveSupport::Concern.singleton_methods
p ActiveSupport::Concern.instance_methods