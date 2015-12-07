require 'rails_helper'

RSpec.describe "inscriptions/new", type: :view do
  before(:each) do
    assign(:inscription, Inscription.new())
  end

  it "renders new inscription form" do
    render

    assert_select "form[action=?][method=?]", inscriptions_path, "post" do
    end
  end
end
