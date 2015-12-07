# File name :: group.rb
# Description :: Class Group is a model class
# to represent groups made by users

class Group < ActiveRecord::Base
  has_many :users, :through => :users_groups
  has_many :users_groups
  belongs_to :discipline, :foreign_key => :discipline_id, class_name: 'Discipline'
  belongs_to :group_owner, class_name: 'User', foreign_key: 'group_owner_id'

  # Method responsible for finding all groups that the user searched, in the DB.
  def self.search(query)
    where('project_name like ?', "%#{query}%")
  end
end
