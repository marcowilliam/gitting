class Inscription < ActiveRecord::Base
	belongs_to :users
	belongs_to :disciplines
end
