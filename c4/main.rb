setups = []
define_method :setup do |&block|
	setups << block
end

@events = []
define_method :event do |description, &block|
	@events << {:description => description, :condition => block}
end


load 'events.rb'

@events.each do |event|
	setups.each(&:call)
	puts "event : #{event[:description]}" if event[:condition].call
end

p "*"*100
puts local_variables.map { |e| "#{e.to_s} : "+ eval("#{e.to_s}").to_s }
puts instance_variables.map { |e| "#{e.to_s} : "+ eval("#{e.to_s}").to_s }