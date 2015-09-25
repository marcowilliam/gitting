# This is a model class to represent a system user

class User < ActiveRecord::Base
	
	#creating a relation with table authentications
	has_many :authentications

	def self.create_with_omniauth(auth)
		create! do |user|
			user.email = auth["info"]["email"]
			user.username = auth["info"]["name"]
		end
	end

end
