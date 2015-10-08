# File name :: user_controller.rb
# Description :: Class UserController is a controller
# to have a control for the users.

class UsersController < ApplicationController
	def new
	end

	def show
		 @user = User.find(params[:id])
	end
end
