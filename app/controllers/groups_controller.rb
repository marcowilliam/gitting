# File name :: groups_controller.rb
# Description :: GroupsController is a controller
# to take actions for all groups.

class GroupsController < ApplicationController

  # Method to create a group instance
  def new
    @groups = Group.new
  end

  def index
  end

  # Method responsible for creating a new group
  def create
    @groups = Group.new(group_params)

    respond_to do |format|
      if @groups.save
        format.html { redirect_to discipline_path(Group.find(params[:discipline_id])) , notice: 'Grupo criado com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  # Method to show the group details
  def show
    @group = Group.find(params[:id])
    @url_api = "https://api.github.com/repos/#{@group.repository_owner}/#{@group.repository_name}"
    @url_collaborators = "#{@url_api}/contributors"
    @url_commits_stats = "#{@url_api}/status/contributors"

    @response = HTTParty.get(@url_collaborators)
    @collaborators = JSON.parse(@response.body)
  end

  # Defining the Class params
  # @params project_name => name of the group project
  #         project_description => description of the group project
  #         repository_name => repository of the group with the source code
  #         repository_owner => owner to repository to consult Git API

  private

  def group_params
    params
      .fetch(:group, {})
      .permit(:project_name, :project_description,:discipline_id,:repository_name,:repository_owner)
  end
end
