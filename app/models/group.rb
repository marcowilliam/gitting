# File name :: group.rb
# Description :: Class Group is a model class
# to represent groups made by users

class Group < ActiveRecord::Base

	has_many :users

	# Method responsible for finding all groups that the user searched, in the DB.
	def self.search(query)
		where("discipline_name like ?", "%#{query}%")
	end

end
