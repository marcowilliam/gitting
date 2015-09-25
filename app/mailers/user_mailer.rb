#This is a class to create a mailer, to confirm the cancel action

class UserMailer < ApplicationMailer
	# Create a default email to send to user
	default :from => "gittingapplication@gmail.com"

	# Method to send a email to confirm the account deleting
	def password_reset(user)
		@user = user
		mail(:to => user.email, :subject => "Cancel account")
	end
end
