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
      @url.vanity ? flash[:messages] = "Share your vanity url, #{root_url}pzz/#{@url.vanity}!" : flash[:messages] = "Your shortened url is #{root_url}pzz/#{@url.id}!"
      redirect_to new_url_path
      
    else
      flash[:error] = "Invalid Url, must contain http://"
      redirect_to new_url_path
      
    end 
  end

  def show
    @url = Url.find(params[:id] || params[:vanity])
    @url.counter += 1
    @url.save 
    redirect_to @url.full_url
  end
end
