# This is a controller to have a control for User Sessions in application

class SessionsController < ApplicationController   
	def new
	end
	#Method that represents the create session action 
	def create     
		auth_hash = request.env['omniauth.auth']

		@authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
		
		if @authorization
			redirect_to root_url
		else
			user = User.new :username => auth_hash["info"]["username"], :email => auth_hash["info"]["email"]
			Authorization.create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
			user.save

			redirect_to root_url
		end
	end
 	
 	#Method that represents the destroy session action 
	def destroy
		session[:user_id] = nil
		render :text => "You've logged out!"
		redirect_to root_url
	end

	def failure
		render :text => "Sorry, but you didn't allow access to our app!"
	end
 
end
