# Class to test methods from Static_pages_controller

require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

# Testing the website navigation and checking the title of pages to Home page
  test "should get home" do
    get :home
    assert_response :success
     assert_select "title", "Pagina Inicial"
  end

# Testing the website navigation and checking the title of pages to About page
  test "should get about" do
    get :about
    assert_response :success
     assert_select "title", "Sobre nós"
  end
end