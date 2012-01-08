class PlansController < ApplicationController
  
  def index
    @plans = Plan.all
  end
  
  def update
    @plans = Plan.all
    @user = current_user
  end
end
