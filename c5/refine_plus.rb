module NewFixnum 
	refine Fixnum do
		alias_method :old_plus, :+

		def + other
			old_plus(other).old_plus(1)
		end
	end
end	

using NewFixnum
p 1 + 1
