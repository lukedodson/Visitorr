class AdminController < ApplicationController
  before_filter :require_login

  def visitors
    @user = current_user
    @visitors = @user.visitors
  end

  def profile
    
  end

end
