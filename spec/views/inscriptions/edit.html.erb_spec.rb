require 'rails_helper'

RSpec.describe "inscriptions/edit", type: :view do
  before(:each) do
    @inscription = assign(:inscription, Inscription.create!())
  end

  it "renders the edit inscription form" do
    render

    assert_select "form[action=?][method=?]", inscription_path(@inscription), "post" do
    end
  end
end
