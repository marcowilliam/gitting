#This is a class to create a mailer, to reset users password

class UserMailer < ApplicationMailer
	# Create a default email to send to user
	default :from => "from@example.com"

	# Method to send a email to reset password
	def password_reset(user)
		@user = user
		mail(:to => user.email, :subject => "Password Reset")
	end
end
