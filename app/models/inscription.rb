class Inscription < ActiveRecord::Base
	belongs_to :students
	belongs_to :disciplines
end
