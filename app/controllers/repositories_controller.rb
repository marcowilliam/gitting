class RepositoriesController < ApplicationController
	def new
		@repository = Repository.new
	end

	def create
		@repository = Repository.new(group_params)

		respond_to do |format|
			if @repository.save
				format.html { redirect_to discipline_path(Repository.find(params[:group_id])) , notice: 'Repositorio cadastrado com sucesso' }
			else
				format.html { render :new }
			end
		end
	end

	def repository_params
    	params
      		.fetch(:repository, {})
      		.permit(:repository_name, :owner_name,:group_id)
  	end
end
