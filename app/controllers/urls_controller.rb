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
      !@url.vanity.empty? ? flash[:messages] = "Share your vanity url, #{root_url}pzz/#{@url.vanity}!" : flash[:messages] = "Your shortened url is #{root_url}pzz/#{@url.id}!"
      redirect_to root_path
    else
      flash[:error] = "Check to make sure you have a valid Url. Must contain http://. If url valid, try a new vanity url."
      render :action => :new  
    end 
    
  end

  def show
    @url = Url.find(params[:id])
    @url.counter += 1
    @url.save 
    redirect_to @url.full_url
  end
    
end
