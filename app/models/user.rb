class User < ApplicationRecord

 	before_save :create_avatar_url

		def create_avatar_url
	    	self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
		end

	before_validation :prep_email



	attr_accessible :avatar_url, :email, :first_name, :last_name, :password, :password_confirmation, :has_secure_password, :username, 

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, uniqueness:true, presence: true
	validates :email, uniqueness: true, presence: true, format: { with: /^[\w.+-]+@([\w]+.)+\w+$/ }



	private

	def prep_email
    	self.email = self.email.strip.downcase if self.email
	end

end
