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

  # Method to edit the User details
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update[params(:email)]
        format.html { redirect_to usuarios_path, notice: 'Alteração realizada com sucesso' }
      else
        format.html { render :new }
      end
    end
  end


end
