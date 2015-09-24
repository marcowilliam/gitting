class ContactMailer < ActionMailer::Base
  default :from => 'email_remetente@gmail.com'

  def contact_message(contact)
    @contact = contact
    mail(:to => 'gittingapplication@gmail.com', :subject => 'Mensagem de Contato')
  end
end