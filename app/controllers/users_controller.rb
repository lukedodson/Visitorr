class UsersController < ApplicationController
  before_filter :require_login, :only => [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login(params[:user][:email], params[:user][:password])
      redirect_to admin_url, :notice => "Successfully registered. Welcome to Visitors"
    else
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to profile_path, :notice => "Profile updated"
    else
      render profile_path, :notice => "I'm sorry, that didn't save. Please try again."
    end
  end
end
