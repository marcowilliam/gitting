# This is a controller to have a control for User Sessions in application

class SessionsController < ApplicationController   
	
	#Method that represents the create session action 
	def create     
		auth = request.env["omniauth.auth"]
		user = auth.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
		session[:user_id] = user.id     
		redirect_to root_url, :notice => "Signed in!"
	end
 	
 	#Method that represents the destroy session action 
	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Signed out!"
	end
 
end
