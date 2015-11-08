# File name :: discipline.rb
# Description :: Class Discipline is a model class
# to represent discipline, a users group created by admins

class Discipline < ActiveRecord::Base

	has_many :inscriptions
	has_many :users, through: :inscriptions
    belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
	# Method responsible for finding all disciplines that the user searched, in the DB.
	def self.search(query)
		where("discipline_name like ?", "%#{query}%")
	end

	def isRegistered?
		@isRegistered = false
		@inscriptions = Inscription.where(:discipline_id => self.id)

		for inscription in @inscriptions
			if inscription.user_id == current_user.id
				@isRegistered = true
			end
		end

		return @isRegistered
	end

end
