module Test
end	

module Printable
	include Test

	def print
		p "printable print"
	end
end	


module Document
	def print_to_screen
		print
	end

	def print
		p "document print"
	end
end

class Book
	include Document
	include Printable
end	

book = Book.new
p Book.ancestors
book.print_to_screen


class Book2
	include Printable
	include Document
end	

book2 = Book2.new
p Book2.ancestors
book2.print_to_screen
