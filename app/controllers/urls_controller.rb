class UrlsController < ApplicationController
	protect_from_forgery with: :exception
	include SessionsHelper
	before_action :redirect_unless_login

	def index
		@url = Url.new
		@ary = Url.order(:id).where(user_id: session[:id])
	end

	def show
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
		def redirect_unless_login
			redirect_to root_path unless logged_in?
		end
end
