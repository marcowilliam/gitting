# File name :: role.rb
# Description :: Class Role is a model class
# to represent the users' roles in their disciplines
# it can be:
# => Creator
# => Adimnistrator
# => Participant

class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true

  

end
