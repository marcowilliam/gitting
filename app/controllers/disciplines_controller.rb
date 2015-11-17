# File name :: disciplines_controller.rb
# Description :: Class DiscilplinesController is a controller 
# to take actions for all disciplines.

class DisciplinesController < ApplicationController
	
	# Default methods for DisciplinesController

	# The method index will show all the disciplines the user has, but if a search
	# has been done, it will show the results for the search
	def index
		if params[:search]
			@disciplines = Discipline.search(params[:search])
			@page_title = "Resultado da Busca"
			@disciplines_not_found = "Nenhuma disciplina encontrada..."
		else
		 	@disciplines = current_user.owned_disciplines
		 	@discipline_partipate = self.make_disciplines

		 	@disciplines.append(@discipline_partipate)
		 	@page_title = "Minhas Disciplinas"
		 	@disciplines_not_found = "Você não possui nenhuma disciplina, clique no 
		 	botão abaixo para criar uma ou pesquise disciplinas para se inscrever."
		end
	end

	# The method show is to show one of disciplines with details
	def show
		@discipline = Discipline.find(params[:id])
		@owner = User.find(@discipline.owner_id)

		@participants = self.make_participants

	end

	# Instantiate a new discipline
	def new
		@discipline = current_user.owned_disciplines.build
	end

	# Set new params into discipline
	def edit
		@discipline = current_user.owned_disciplines.find(params[:id])
	end

	# Save the new discipline with validates
	def create
		@discipline = current_user.owned_disciplines.build(discipline_params)

		if @discipline.save
			redirect_to @discipline, notice: "Nova disciplina criada"
		else
			render action: "new"
		end
	end

	# Update the discipline edited into database
	def update
		@discipline = current_user.owned_disciplines.build(discipline_params)

		if @discipline.update(room_params)
			redirect_to @discipline, notice: "Você atualizou uma disciplina"
		else
			render action: "edit"
		end
	end

	# Method to remove a discipline instance
	def destroy
		@discipline = current_user.owned_disciplines.find(params[:id])
		@discipline.destroy

		redirect_to disciplines_url

	end

	# Method to associate a new instance into the current user
	def make_disciplines
		@disciplines_from_user = current_user.registered_disciplines
		@disciplines_registered = Array.new()

		for discipline_id in @disciplines_from_user
			@get_disciplines = Discipline.find(discipline_id)
			@disciplines_registered << @get_disciplines
		end

		return @disciplines_registered
	end

	# Method to insert a new user to the discipline
	# this user will be participant role
	def make_participants
		@participants_id = @discipline.users_registered()
		@participants = Array.new()
		
		for user_in_discipline_id in @participants_id
			@get_user_in_discipline = User.find(user_in_discipline_id)
			@participants << @get_user_in_discipline
		end

		return @participants
	end

	# Definning the Class params
	# @params discipline_name => Name of the discipline
	#         discipline_description => Some things about the discipline
	private

	def discipline_params
		params.
		require(:discipline).
		permit(:discipline_name,:discipline_description)
	end
end
