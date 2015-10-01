# File name :: application_controller.rb
# Description :: Class ApplicationController is a controller 
# to take actions for all system.
class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	helper_method :current_user, :logged_in?
 
  	private
 
  	def current_user
   		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	 def logged_in?
       current_user != nil
     end
end
