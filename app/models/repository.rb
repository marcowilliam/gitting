# File name :: respository.rb
# Description :: Class Repository is a model class
# to represent a repository from a group of users

class Repository < ActiveRecord::Base
	  belongs_to :group
end
