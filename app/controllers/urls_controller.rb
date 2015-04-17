class UrlsController < ApplicationController
	protect_from_forgery with: :exception
	include SessionsHelper
	before_action :redirect_unless_login

	def index
		@url = Url.new
		@ary = Url.order(:id).where(user_id: current_user.id)
	end

	def show
	end

	def new
	end

	def create
		last_url = Url.last
		id = last_url.nil? ? 0 : last_url.id
		id += 1
		params[:url].merge!({short_url: id, user_id: current_user.id})
		url = Url.create(url_params)
		redirect_to home_path
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

	def url_params
		params.require(:url).permit(:long_url, :short_url, :user_id)
	end
end
