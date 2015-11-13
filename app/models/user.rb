# File name :: user.rb
# Description :: Class User is a model class
# to represent a system user

class User < ActiveRecord::Base
	
	#creating a relation with table authentications
	has_many :authentications
	has_many :inscriptions
	has_many :disciplines, through: :inscriptions
	has_many :owned_disciplines, :class_name => "Discipline", :foreign_key => "owner_id"


	#make a validation for elements in model
	#validates_presence_of :email, :username
	#validates_associated :authentications
	#validates_uniqueness_of :email

	def self.create_with_omniauth(auth)
	    create! do |user|
	      if auth['info']
	         user.username = auth['info']['name'] || ""
	      end
	    end
  	end

  	def registeredDisciplines
		@inscriptions = Inscription.where(:user_id => self.id)
		@listOfDisciplineRegistred = Array.new()

		for inscription in @inscriptions
			if inscription.user_id == self.id
				@listOfDisciplineRegistred << inscription.discipline_id
			end
		end

		return @listOfDisciplineRegistred
  	end
end
