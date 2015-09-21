# Controller to take actions for all system
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
