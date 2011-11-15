class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def not_authenticated
    redirect_to sign_in_path, :alert => "Please sign in to continue."
  end
end
