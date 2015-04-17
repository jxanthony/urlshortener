class SessionsController < ApplicationController

	include SessionsHelper
	def new
	end

	def create
		user = User.authenticate(params[:session][:email], params[:session][:password])
		if user.nil?
			flash[:danger] = 'Invalid email/password combination'
			redirect_to login_path
		else
			log_in(user)
			redirect_to home_path
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to login_path
	end
end
