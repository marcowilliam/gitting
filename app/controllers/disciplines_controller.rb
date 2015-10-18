# File name :: disciplines_controller.rb
# Description :: Class DiscilplinesController is a controller 
# to take actions for all disciplines.

class DisciplinesController < ApplicationController
	def index
		@disciplines = current_user.disciplines
	end
end
