# File name :: authorization.rb
# Description :: Class Authorization is a model class
# to represent authorization by an user

class Authorization < ActiveRecord::Base
	
	belongs_to :user
	validates :provider, :uid, :presence => true
	validates_associated :user
	validates_uniqueness_of :uid

	# Method to takes api github data
	def self.find_or_create(auth_hash)
		unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
			user = User.create :username => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
			llogger.debug "A new User has been created #{@user.attributes.inspect}"
			auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
			logger.info "A new Authorization has been created #{@auth.attributes.inspect}"
		end

		return auth
	end
end
