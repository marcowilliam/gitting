# File name :: contact.rb
# Description :: Class Contact is a model class
# to represent users that will contact the team

class Inscription < ActiveRecord::Base
	belongs_to :users
	belongs_to :disciplines
end
