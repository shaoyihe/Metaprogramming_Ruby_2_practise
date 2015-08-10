require 'active_record'

conn = ActiveRecord::Base.establish_connection :adapter => "sqlite3",
			:database => "D:/projcect/ruby/sqlite3/test_he.sqlite3"
# p conn


class Duck < ActiveRecord::Base
	validate do
		errors.add(:base, "Illegal duck name.") unless name[0] == 'D'
	end
end

duck = Duck.new
duck.name = "Test"
p duck
p duck.save!

ducks = Duck.all
p ducks
p ducks.each(&:delete)