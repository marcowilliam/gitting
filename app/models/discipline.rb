# File name :: discipline.rb
# Description :: Class Discipline is a model class
# to represent discipline, a users group created by admins
class Discipline < ActiveRecord::Base
	
	resourcify

	before_action :require_authentication, only: [:new, :edit, :create, :update,:destroy]

	has_many :inscriptions
	belongs_to :users

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
		@discipline =  current_user.disciplines.build(discipline_params)

		if @discipline.save
			redirect_to @discipline, notice: "Disciplina criada com sucesso"
		else
			render action: "new"
		end
	end

	def update
		@discipline = current_user.disciplines.find(params[:id])

		if @discipline.update(params[:discipline])
			redirect_to @discipline, notice: "Disciplina salva com sucesso"
		else
			render action: "edit"
		end
	end

	def destroy
		@discipline = Discipline.find(params[:id])
		@discipline.destroy

		redirect_to disciplines_url
	end

	def discipline_params
		params.
		require(:discipline)
		permit( :discipline_name, :discipline_description, :discipline_year)
	end

end
