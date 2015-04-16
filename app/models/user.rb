class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,	presence: true,
						length: {minimum: 6, maximum: 255},
						format: { with: VALID_EMAIL_REGEX },
						uniqueness: { case_sensitive: false }
	validates :password, length: {maximum: 50}
	has_many :urls

	def self.authenticate(email, password)
		begin
			user = self.find_by_email(email.downcase)
		rescue
			return nil
		else
			return user if password == user.password
		end
	end
end
