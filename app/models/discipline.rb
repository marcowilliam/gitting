# File name :: discipline.rb
# Description :: Class Discipline is a model class
# to represent discipline, a users group created by admins
class Discipline < ActiveRecord::Base
	has_many :inscriptions
	belongs_to :teachers
end
