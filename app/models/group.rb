# File name :: group.rb
# Description :: Class Group is a model class
# to represent groups made by users

class Group < ActiveRecord::Base
  has_many :users
  belongs_to :discipline, :foreign_key => :discipline_id, class_name: 'Discipline'

  # Method responsible for finding all groups that the user searched, in the DB.
  def self.search(query)
    where('project_name like ?', "%#{query}%")
  end
end
