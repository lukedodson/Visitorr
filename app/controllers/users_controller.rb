class UsersController < ApplicationController
  before_filter :require_login, :only => [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login(params[:user][:email], params[:user][:password])
      redirect_to profile_url, :notice => "Welcome to Visitorr! Please take a moment to fill in your information. This information will be sent to your visitors!"
    else
      flash.now = "Something went wrong"
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_back_or_to profile_path, :notice => "Profile updated"
    else
      render profile_path, :notice => "I'm sorry, that didn't save. Please try again."
    end
  end

  def cancel_subscription
    if @user = current_user
      cu = Stripe::Customer.retrieve(@user.stripe_id)
      cu.cancel_subscription
      @user.update_attributes(:subscribed => false, :last_4_digits => nil)
      redirect_to edit_profile_path, :notice => "You'll be back.. they always come back"
    end
  end
  
  def failed_payment
    @user = User.find_by_stripe_id(params[:invoice][:customer])
    @event = params[:invoice][:event]
    if @event == "recurring_payment_failed"
      @user.update_attributes(:subscribed => false, :last_4_digits => nil)
    end
  end  
end
