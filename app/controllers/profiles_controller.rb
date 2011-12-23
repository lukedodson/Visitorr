class ProfilesController < ApplicationController
  before_filter :require_login
  before_filter :subscribed
  
  def show
    @user = User.find_by_id(current_user.id)
    @profile = Profile.find_by_user_id(@user.id)
    if @profile.nil?
      redirect_to new_profile_path
    end
  end
  
  def new
    @user = current_user
    @profile = @user.build_profile
  end
  
  def create
    @user = User.find_by_id(current_user.id)
    @profile = @user.build_profile(params[:profile])
    if @profile.save
      redirect_to profile_path(@user), :notice => "Profile updated"
    else
      render 'new'
    end
  end
  
  def edit
    @user = current_user
    @profile = Profile.find_by_user_id(@user.id) || @user.build_profile
  end
  
  def update
    @user = current_user
    @profile = Profile.find_by_user_id(@user.id) || @user.build_profile
    if @profile.update_attributes(params[:profile])
      redirect_to profile_path(@user), :notice => "Profile updated"
    else
      render 'edit'
    end
  end
  
  def test_email
    @user = current_user
    @profile = Profile.find_by_user_id(@user.id)
    if @profile
      TestMailer.test(@user).deliver
      redirect_to profile_path(@user), :notice => "Test email has been sent"
    else
      flash.now.notice = "You need to save your profile first."
      render new_profile_path
    end
  end
end
