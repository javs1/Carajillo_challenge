class UrlController < ApplicationController
  require 'securerandom'
  skip_before_action :verify_authenticity_token
  def index
    @urls=Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.slug = "http://localhost:3000/"+SecureRandom.alphanumeric(8)
    if @url.save
      redirect_to "/"
    else
      render "index"
    end
  end

  def delete

    @url = Url.find(params[:id]) 
    @url.destroy
    redirect_to "/"
  end

  def show
    @urls=Url.all
  end

  private

  def url_params
    params.permit(:title,:value)
  end
end
