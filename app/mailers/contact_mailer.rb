# File name :: contact_mailer.rb
# Description :: Class ContactMailer is a class 
# to create a mailer, to contact the developer team

class ContactMailer < ActionMailer::Base
  
  # Create a default email to send
  default :from => 'email_remetente@gmail.com'

  # Method to send the user mensage to developer team
  def contact_message(contact)
    @contact = contact
    mail(:to => 'gittingapplication@gmail.com', :subject => 'Mensagem de Contato')
  end
end