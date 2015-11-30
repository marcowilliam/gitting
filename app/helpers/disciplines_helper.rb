# File name :: disciplines_helper.rb
# Description :: Class DisciplinesHelper from Rails framework
# to configure disciplines setups and tools

module DisciplinesHelper
	def belongs_to_user(discipline)
		current_user && room.user == current_user
	end
end
