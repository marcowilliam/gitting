# File name :: user_controller.rb
# Description :: Class UserController is a controller
# to have a control for the users.

class UsersController < ApplicationController
  # Method to create a user instance
  def new
  end

  # Method to show the user details
  def show
    @user = User.find(params[:id])
  end
end
