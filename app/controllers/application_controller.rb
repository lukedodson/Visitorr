class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def subscribed
    @user = current_user
    redirect_to settings_path, :notice => "You are not currently subscribed. Please enter your payment information to access your visitors." if current_user.subscribed == false
  end

  private
  
  def not_authenticated
    redirect_to sign_in_path, :alert => "Please sign in to continue."
  end
  

end
