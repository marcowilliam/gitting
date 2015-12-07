require 'rails_helper'

RSpec.describe "Disciplines", type: :request do
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  end

  it "test the current user"
    expect(assigns(:user_id)).to eq([current_user.id])
  end


end
