class UrlsController < ApplicationController
	protect_from_forgery with: :exception
	include SessionsHelper
	before_action :redirect_unless_login

	def index
		@url = Url.new
		@ary = Url.order(:id).where(user_id: current_user.id)
	end

	def show
		url = Url.find_by(short_url: params[:short_url], user_id: current_user.id)
		byebug
		if url.nil?
			long_url = home_path
		else
			long_url = url.long_url.to_s
		end
		redirect_to long_url
	end

	def new
	end

	def create
		last_url = Url.last
		if last_url.nil?
			id = 0
		else
			id = last_url.id + 1
		end
		params[:url].merge!({short_url: id.to_s, user_id: current_user.id})
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
