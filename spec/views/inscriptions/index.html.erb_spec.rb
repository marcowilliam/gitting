require 'rails_helper'

RSpec.describe "inscriptions/index", type: :view do
  before(:each) do
    assign(:inscriptions, [
      Inscription.create!(),
      Inscription.create!()
    ])
  end

  it "renders a list of inscriptions" do
    render
  end
end
