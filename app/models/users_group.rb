# File name :: users_groups.rb
# Description :: Class UsersGroup is a model class
# to represent a group of Users

class UsersGroup < ActiveRecord::Base
  # creating a relation with table authentications
  belongs_to :user
  belongs_to :group
end
