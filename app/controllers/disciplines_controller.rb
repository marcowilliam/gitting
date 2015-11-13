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
			logger.debug "Recieve a discipline of user owner #{@discipline}"

			@pageTitle = "Resultado da Busca"
			@disciplinesNotFound = "Nenhuma disciplina encontrada..."
		else
		 	@disciplines = current_user.owned_disciplines
		 	@discipline_partipate = self.make_disciplines

		 	@disciplines.append(@discipline_partipate)
		 	@pageTitle = "Minhas Disciplinas"
		 	@disciplinesNotFound = "Você não possui nenhuma disciplina, clique no 
		 	botão abaixo para criar uma ou pesquise disciplinas para se inscrever."
		end
	end

	def show
		@discipline = Discipline.find(params[:id])

		@owner = User.find(@discipline.owner_id)

		@participants = self.make_participants

	end

	def new
		@discipline = current_user.owned_disciplines.build
	end

	def edit
		@discipline = current_user.owned_disciplines.find(params[:id])
	end

	def create
		@discipline = current_user.owned_disciplines.build(discipline_params)
		logger.debug "Recieve a discipline of user owner #{@discipline}"

		if @discipline.save
			redirect_to @discipline, notice: "Nova disciplina criada"
		else
			render action: "new"
		end
	end

	def update
		@discipline = current_user.owned_disciplines.build(discipline_params)

		if @discipline.update(room_params)
			redirect_to @discipline, notice: "Você atualizou uma disciplina"
		else
			render action: "edit"
		end
	end

	def destroy
		@discipline = current_user.owned_disciplines.find(params[:id])
		@discipline.destroy

		redirect_to disciplines_url

	end

	def make_disciplines
		@disciplinesFromUser = current_user.registeredDisciplines
		logger.debug "Recieve a list of discipline_id #{@disciplinesFromUser.kind_of?(Array)}"

		@disciplines_registered = Array.new()

		for disciplineId in @disciplinesFromUser
			@getDisciplines = Discipline.find(disciplineId)
			@disciplines_registered << @getDisciplines
		end

		return @disciplines_registered
	end

	def make_participants
		@participantsId = @discipline.usersRegistered()
		logger.debug "Recieve a list of discipline_id: #{@participantsId.kind_of?(Array)}"

		@participants = Array.new()
		
		for userInDisciplineId in @participantsId
			@getUserInDiscipline = User.find(userInDisciplineId)
			@participants << @getUserInDiscipline
		end

		return @participants
	end

	private

	def discipline_params
		params.
		require(:discipline).
		permit(:discipline_name,:discipline_description)
	end
end
