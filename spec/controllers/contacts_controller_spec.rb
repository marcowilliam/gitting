require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
	let(:valid_attributes){ {

		:id => 1,
		:name => "Fulano",
		:subject => "fulano@dominio.com",
		:message => "Text mensage to test",
		:email => "fulano@dominio.com"
	} }

	let(:valid_session) { {} }


describe "GET new" do
    it "assigns a new contact as @contact" do
      get :new, {}, valid_session
    end
  end

	describe "POST #create" do
	    context "with valid params" do
	      it "assigns a newly created contact as @contact" do
	        post :create, {:contact => valid_attributes}, valid_session
	        expect(assigns(:contact)).to be_a(Contact)
	      end
	    end
  	end

end
