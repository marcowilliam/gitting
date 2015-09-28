# This is a model class to represent a system user

class User < ActiveRecord::Base
	
	#creating a relation with table authentications
	has_many :authentications

	#make a validation for elements in model
	validates_presence_of :email, :username
	validates_associated :authentications
	validates_uniqueness_of :email

end
