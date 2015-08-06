module Kernel
	def using(res)
		begin
			return yield
		ensure
			res.dispose
		end
	end

end