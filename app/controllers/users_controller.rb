class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])

  	if @user.save
  		flash[:messages] = "Thank you for registering."
  		redirect_to @user
  	else
  		render :action => :new
  	end
  end
end
