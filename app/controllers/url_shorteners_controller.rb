class UrlShortenersController < ApplicationController
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
end
