v = "test"

class Scope
	def  execute
		puts v
	end
end

def outer
	puts "#{__method__}:#{v} "
end

begin
	outer
	scope = Scope.new
	scope.execute
rescue Exception => e
end


define_method :outer2 do
	puts "#{__method__} : #{v}"
end

outer2
