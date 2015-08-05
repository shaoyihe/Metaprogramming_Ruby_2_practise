class Xml < Object
	def initialize(indent: 2)
		@xml = []
		@layer = 0;
		@indent= indent;

		# (self.methods - BasicObject.instance_methods).each{|m|  undef_method m}
		# p self.methods
	end

	def method_missing(m, *val, **key)
		key_str = "  " + key.map {|k,v| "#{k}=\"#{v}\""}.join("  ")if !key.empty?
		@xml <<" " * @indent * @layer + "<#{m.to_s}#{key_str}" + ">"
		if block_given?
			@layer += 1
			yield self
			@layer -= 1
		end
		@xml<< " " * @indent * (@layer + 1) + val.join if !val.empty?
		@xml<< " " * @indent * @layer + "</#{m.to_s}>"
	end

	def to_s
		@xml.join("\n")
	end
end

xml = Xml.new
xml.person do |b|
	b.name(class: "test2"){|b| b.age(100); } 
	b.phone("555-1234") 
end

puts xml.to_s

