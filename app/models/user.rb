# This is a model class to represent a system user

class User < ActiveRecord::Base
	
	#creating a relation with table authentications
	has_many :authentications

end
