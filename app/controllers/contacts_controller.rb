class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      ContactMailer.contact_message(params[:contact]).deliver_now
      flash[:notice] = 'Mensagem enviado com sucesso'
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