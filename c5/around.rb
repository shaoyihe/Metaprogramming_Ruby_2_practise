class Amazon
	def self.new_exception_method new_method, old_method
		define_method new_method do |*para|
			begin
				old_method.call(*para)
			rescue Exception => e
				puts "error"
				# raise e
			end
		end
	end

	def initialize
		(methods - Object.methods).each do |method|
			old_method = method(method)
			Amazon.new_exception_method(method, old_method)
		end
	end

	def has_any?
		puts "call"
		raise
	end

end

amazon = Amazon.new
amazon.has_any?