require 'rails_helper'

RSpec.describe "inscriptions/show", type: :view do
  before(:each) do
    @inscription = assign(:inscription, Inscription.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
