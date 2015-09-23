# This is a model class to represent a system user

class User < ActiveRecord::Base

 def self.create_with_omniauth(auth)
    create! do |user|
      user.email = auth["info"]["email"]
      user.username = auth["info"]["name"]
    end
  end

end
