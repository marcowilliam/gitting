# File name :: discipline.rb
# Description :: Class Discipline is a model class
# to represent discipline, a users group created by admins

class Discipline < ActiveRecord::Base

	has_many :inscriptions
	has_many :groups
	has_many :users, through: :inscriptions
    belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"

	# Method responsible for finding all disciplines that the user searched, in the DB.
	def self.search(query)
		where("discipline_name like ?", "%#{query}%")
	end

	# Method to verificate if the user exist in database
	def is_registered?
		@is_registered = false
		@inscriptions = Inscription.where(:discipline_id => self.id)

		for inscription in @inscriptions
			if inscription.discipline_id == self.id
				@is_registered = true
			end
		end

		return @is_registered
	end

	# Method to return all users registered
	def users_registered
		@inscriptions = Inscription.where(:discipline_id => self.id)
		@list_of_users_registred = Array.new()

		for inscription in @inscriptions
			if inscription.discipline_id == self.id
				@list_of_users_registred << inscription.user_id
			end
		end
		return @list_of_users_registred
	end

end
