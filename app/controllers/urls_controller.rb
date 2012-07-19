class UrlsController < ApplicationController
  def new
      @url = Url.new
      # if params[:url]
      #      @u = Url.new(:full_url => @params[:url])
      #      if @u.save
      #        do something
      #        else
      #          show error message
      #        end
      #    end
    end

    def create
      @url = Url.new(:full_url => params[:full_url])
      @url.save
      redirect_to root_path
    end

    # def show
    #     redirect_to @url(params[:id]).full_url
    #   end
end
