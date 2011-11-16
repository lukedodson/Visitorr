class AdminController < ApplicationController
  before_filter :require_login
  before_filter :subscribed

  def visitors
    @user = current_user
    @visitors = @user.visitors
  end

  def profile
    
  end

  private

    def subscribed
      @user = current_user
      redirect_to edit_profile_path, :notice => "You are not currently subscribed. Please enter your payment information to access your visitors." if current_user.subscribed == false
    end
end
