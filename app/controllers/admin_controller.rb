class AdminController < ApplicationController
  before_filter :require_login
  before_filter :subscribed

  def visitors
    @user = current_user
    @visitors = @user.visitors.order("created_at desc")
  end
end
