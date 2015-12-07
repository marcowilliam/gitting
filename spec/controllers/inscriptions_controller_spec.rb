require 'rails_helper'

RSpec.describe InscriptionsController, type: :controller do
=begin
  # This should return the minimal set of attributes required to create a valid
  # Inscription. As you add validations to Inscription, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # InscriptionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all inscriptions as @inscriptions" do
      inscription = Inscription.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:inscriptions)).to eq([inscription])
    end
  end

  describe "GET #show" do
    it "assigns the requested inscription as @inscription" do
      inscription = Inscription.create! valid_attributes
      get :show, {:id => inscription.to_param}, valid_session
      expect(assigns(:inscription)).to eq(inscription)
    end
  end

  describe "GET #new" do
    it "assigns a new inscription as @inscription" do
      get :new, {}, valid_session
      expect(assigns(:inscription)).to be_a_new(Inscription)
    end
  end

  describe "GET #edit" do
    it "assigns the requested inscription as @inscription" do
      inscription = Inscription.create! valid_attributes
      get :edit, {:id => inscription.to_param}, valid_session
      expect(assigns(:inscription)).to eq(inscription)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Inscription" do
        expect {
          post :create, {:inscription => valid_attributes}, valid_session
        }.to change(Inscription, :count).by(1)
      end

      it "assigns a newly created inscription as @inscription" do
        post :create, {:inscription => valid_attributes}, valid_session
        expect(assigns(:inscription)).to be_a(Inscription)
        expect(assigns(:inscription)).to be_persisted
      end

      it "redirects to the created inscription" do
        post :create, {:inscription => valid_attributes}, valid_session
        expect(response).to redirect_to(Inscription.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved inscription as @inscription" do
        post :create, {:inscription => invalid_attributes}, valid_session
        expect(assigns(:inscription)).to be_a_new(Inscription)
      end

      it "re-renders the 'new' template" do
        post :create, {:inscription => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested inscription" do
        inscription = Inscription.create! valid_attributes
        put :update, {:id => inscription.to_param, :inscription => new_attributes}, valid_session
        inscription.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested inscription as @inscription" do
        inscription = Inscription.create! valid_attributes
        put :update, {:id => inscription.to_param, :inscription => valid_attributes}, valid_session
        expect(assigns(:inscription)).to eq(inscription)
      end

      it "redirects to the inscription" do
        inscription = Inscription.create! valid_attributes
        put :update, {:id => inscription.to_param, :inscription => valid_attributes}, valid_session
        expect(response).to redirect_to(inscription)
      end
    end

    context "with invalid params" do
      it "assigns the inscription as @inscription" do
        inscription = Inscription.create! valid_attributes
        put :update, {:id => inscription.to_param, :inscription => invalid_attributes}, valid_session
        expect(assigns(:inscription)).to eq(inscription)
      end

      it "re-renders the 'edit' template" do
        inscription = Inscription.create! valid_attributes
        put :update, {:id => inscription.to_param, :inscription => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested inscription" do
      inscription = Inscription.create! valid_attributes
      expect {
        delete :destroy, {:id => inscription.to_param}, valid_session
      }.to change(Inscription, :count).by(-1)
    end

    it "redirects to the inscriptions list" do
      inscription = Inscription.create! valid_attributes
      delete :destroy, {:id => inscription.to_param}, valid_session
      expect(response).to redirect_to(inscriptions_url)
    end
  end
=end
end
