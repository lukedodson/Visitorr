class PlansController < ApplicationController
  
  def index
    @plans = Plan.order("price desc")
  end
  
  def update
    @plans = Plan.all
    @user = current_user
  end
end
