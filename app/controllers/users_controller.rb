class UsersController < ApplicationController
	def index
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		ret = User.create(user_params)
		if ret.nil?
			redirect_to login_path
		end

		session[:id] = ret.id
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
