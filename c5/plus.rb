class Fixnum
	alias_method :old_plus, :+

	def + other
		old_plus(other).old_plus(1)
	end
end	

p 1 + 1