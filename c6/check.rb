module CheckedAttributes

	def attr_checked(sym, &block)
		attr_reader sym

		define_method((sym.to_s+"=").to_sym) do |*param|
			raise RuntimeError if ! block.call(*param)
			instance_variable_set("@"+sym.to_s, *param)
		end
	end

end	


module CheckedAttributes2
	def self.included(c)
		def c.test2
			puts "test"
		end

		def c.attr_checked(sym, &block)
			attr_reader sym

			define_method((sym.to_s+"=").to_sym) do |*param|
				raise RuntimeError if ! block.call(*param)
				instance_variable_set("@"+sym.to_s, *param)
			end
		end
	end
end	