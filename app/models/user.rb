class User < ActiveRecord::Base
	validates_uniqueness_of :email
	validates_presence_of :email
	has_many :urls

	def self.authenticate(email, password)
		begin
			user = self.find_by_email(email)
		rescue
			return nil
		else
			return user if password == user.password
		end
	end
end
