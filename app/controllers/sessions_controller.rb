class SessionsController < ApplicationController

	include SessionsHelper
	def new
	end

	def create
		user = User.authenticate(params[:session][:email], params[:session][:password])
		if user.nil?
			flash[:danger] = 'Invalid email/password combination'
			render 'new'
		end
		log_in(user)
		redirect_to home_path
	end

	def destroy
		log_out if logged_in?
		redirect_to 'new'
	end
end
