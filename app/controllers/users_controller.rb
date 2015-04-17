class UsersController < ApplicationController
	include SessionsHelper

	def index
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		user = User.create(user_params)
		if user.nil?
			session[:message] = "Oh dear! Something went wrong. Please try again later."
			session[:message_type] = "danger"
			redirect_to login_path
		end
		log_in(user)
		session[:message] = "Sign Up Successful"
		session[:message_type] = "success"
		redirect_to home_path
	end

	def edit
	end

	def update
	end

	def destroy
	end

	# Unofficial routes
	def login
	end

	private
	def user_params
		params.require(:user).permit(:email, :password)
	end
end
