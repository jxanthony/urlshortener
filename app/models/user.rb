class User < ActiveRecord::Base
	validates_uniqueness_of :email
	validates_presence_of :email, :name
	has_many :urls

	def self.authenticate(email, password)
		begin
			user = self.find_by_email(email)
		rescue
			user = nil
		ensure
			return user if not user.nil? and email == user.email and password == user.password
		end
		nil
	end
end
