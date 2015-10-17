module DisciplinesHelper
	def belongs_to_user(discipline)
		current_user && room.user == current_user
	end
end
