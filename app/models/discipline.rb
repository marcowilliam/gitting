# File name :: discipline.rb
# Description :: Class Discipline is a model class
# to represent discipline, a users group created by admins
class Discipline < ActiveRecord::Base
	
	resourcify

	before_action :require_authentication, only: [:new, :edit, :create, :update,:destroy]

	has_many :inscriptions
	belongs_to :users

	def show
		@discipline = Discipline.find(params[:id])
	end

	def new
		@discipline = Discipline.new
	end

	def edit
		@discipline = Discipline.find(params[:id])
	end

	def create
		@discipline = Discipline.new(params[:discipline])

		if @discipline.save
			redirect_to @discipline, notice: "Disciplina criada com sucesso"
		else
			render action: "new"
		end
	end

	def update
		@discipline = Discipline.find(params[:id])

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

end
