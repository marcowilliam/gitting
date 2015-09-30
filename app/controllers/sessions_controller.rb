# This is a controller to have a control for User Sessions in application

class SessionsController < ApplicationController   
	#Method that represents the create session action 
	def create     
		auth_hash = request.env['omniauth.auth']

		@authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
		
		if @authorization
			session[:user_id] = @authorization.user.id
			redirect_to root_url
			logger.info "This user exist in system"
			flash[:success] =  "Bem vindo, você logou!"
		else
			user = User.new :username => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
			Authorization.create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
			user.save
			session[:user_id] = user.id
			redirect_to root_url
			flash[:success] =  "Bem vindo, você se cadastrou com sucesso"
		end
	end
 	
 	#Method that represents the destroy session action 
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
