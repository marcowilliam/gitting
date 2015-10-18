# File name :: disciplines_controller.rb
# Description :: Class DiscilplinesController is a controller 
# to take actions for all disciplines.

class DisciplinesController < ApplicationController
	def index
		@disciplines = current_user.disciplines
	end

	def show
		@discipline = Discipline.find(params[:id])
	end

	def new
		@discipline = current_user.disciplines.build
	end

	def edit
		@discipline = current_user.disciplines.find(params[:id])
	end

	def create
		@discipline = current_user.disciplines.build(discipline_params)

		if @discipline.save
			current_user.add_role :admin, Discipline.last
			redirect_to @discipline, notice: "Nova disciplina criada"
		else
			render action: "new"
		end
	end

	def update
		@discipline = current_user.disciplines.build(discipline_params)

		if @discipline.update(room_params)
			redirect_to @discipline, notice: "Você atualizou uma disciplina"
		else
			render action: "edit"
		end
	end

	def destroy
		@discipline = current_user.disciplines.find(params[:id])
		@discipline.destroy

		redirect_to disciplines_url

	end

	private

	def discipline_params
		params.
		require(:discipline).
		permit(:discipline_name,:discipline_description)
	end
end
