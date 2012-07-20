class UrlsController < ApplicationController
  def new
      @url = Url.new
    end

    def create
      @url = Url.new(params[:url])
      if @url.save
        flash[:messages] = "Success! Your shortened url is #{root_url}pzz/#{@url.id}"
        redirect_to root_path
        
      else
        flash[:error] = "Invalid Url, must contain http://"
        redirect_to root_path
        
      end 
    end

    def show
      redirect_to Url.find(params[:id]).full_url
    end
end
