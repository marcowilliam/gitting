# File name :: user.rb
# Description :: Class User is a model class
# to represent a system user

class User < ActiveRecord::Base
  # creating a relation with table authentications
  has_many :authentications
  has_many :inscriptions
  has_many :disciplines
  has_many :users, :through => :users_groups
  has_many :users_groups


  # Create a user instance by the github api
  def self.create_with_omniauth(auth)
    create! do |user|
      user.username = auth['info']['name'] || '' if auth['info']
    end
    end
end
