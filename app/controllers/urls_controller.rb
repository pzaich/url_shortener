class UrlsController < ApplicationController
  def index
    @urls = Url.find(:all)
  end
  
  def new
    @url = Url.new
  end

  def create
    @url = Url.new(params[:url])
    if @url.save
      flash[:messages] = "Success! Your shortened url is #{root_url}pzz/#{@url.id}"
      redirect_to new_url_path
      
    else
      flash[:error] = "Invalid Url, must contain http://"
      redirect_to new_url_path
      
    end 
  end

  def show
    @url = Url.find(params[:id])
    @url.counter.nil? ? @url.counter = 1 : @url.counter += 1
    @url.save 
    redirect_to @url.full_url
  end
end
