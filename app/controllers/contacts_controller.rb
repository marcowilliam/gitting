# File name :: contacts_controller.rb
# Description :: Class ContactsController is a controller 
# to take actions for all contacts.

class ContactsController < ApplicationController

  # Method instantiates a new contact and calls the "new" view from the contact's folder
  def new
    @contact = Contact.new
  end

  # Method responsible for creating a new contact, however this contact won't be saved 
  #   in the database, since we will use it just once to send the e-mail
  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      ContactMailer.contact_message(params[:contact]).deliver_now
      flash[:notice] = 'Mensagem enviada com sucesso'
      redirect_to :action => 'new'
      return  
    end


    render :action => 'new'
  end

  private

  def contact_params
    allow = [:name, :subject, :message, :email]
    params.require(:contact).permit(allow)
  end


end