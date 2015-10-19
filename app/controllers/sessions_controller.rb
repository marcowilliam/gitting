# File name :: sessions_controller.rb
# Description :: Class SessionsController is a controller
# to have a control for User Sessions in application.

class SessionsController < ApplicationController   
	
	# Method that runs when the user wants to log in 
	def new
		redirect_to "auth/github"
	end

	# Method that represents the create session action 
	def create     
		auth_hash = request.env['omniauth.auth']

		@authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
		
		if @authorization
			session[:user_id] = @authorization.user.id
			redirect_to '/dashboard'
			logger.info "This user exist in system"
			flash[:success] =  "Bem vindo, você logou!"
		else
			user = User.create_with_omniauth(auth_hash)
			Authorization.create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
			user.save
			session[:user_id] = user.id
			redirect_to '/dashboard'
			flash[:success] =  "Bem vindo, você se cadastrou com sucesso"
		end
	end

 	# Method that represents the destroy session action 
	def destroy
		session[:user_id] = nil
		redirect_to root_url
		logger.info "This user exist in has been made logoff"
		flash[:success] =  "Você foi deslogado"
	end

	def failure
		flash[:error] = "Desculpa, mas houve um erro."
		redirect_to root_url
	end
 
end
