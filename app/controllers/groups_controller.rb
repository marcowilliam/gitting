# File name :: groups_controller.rb
# Description :: GroupsController is a controller
# to take actions for all groups.

class GroupsController < ApplicationController
  # Method to create a group instance
  def new
  end

  # Method responsible for creating a new group
  def create
    @group = Group.new(group_params)
    render action: 'new'
  end

  # Method to show the group details
  def show
    @group = Group.find(params[:id])
  end

  # Defining the Class params
  # @params project_name => name of the group project
  #         project_description => description of the group project
  #         source => repository of the group with the source code

  private

  def group_params
    params
      .require(:group)
      .permit(:project_name, :project_description, :source)
  end
end
