# File name :: groups_controller.rb
# Description :: GroupsController is a controller
# to take actions for all groups.

class GroupsController < ApplicationController

  # Method to create a group instance
  def new
    @groups = Group.new
  end

  def index
    if params[:search]
      @groups = Group.search(params[:search])
      logger.debug "Recieve a group of user owner #{@group}"

      @page_title = 'Resultado da Busca'
      @groups_not_found = 'Nenhum grupo encontrada...'
    else
      @groups = Group.find(@discipline.id)
      @page_title = 'Meus Grupos'
      @groups_not_found = "Não existe nenhum Grupo criado, clique no
     botão abaixo para criar um."
    end
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
  end

  # Defining the Class params
  # @params project_name => name of the group project
  #         project_description => description of the group project
  #         source => repository of the group with the source code

  private

  def group_params
    params
      .fetch(:group, {})
      .permit(:project_name, :project_description, :source, :discipline_id)
  end
end
