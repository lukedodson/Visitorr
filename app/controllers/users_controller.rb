class UsersController < ApplicationController
  before_filter :require_login, :only => [:edit, :update]

  def new
    if params[:plan_id]
      plan = Plan.find(params[:plan_id])
      @user = plan.users.build
    else
      redirect_to plans_path
    end
    if params[:PayerID]
      @user.paypal_customer_token = params[:PayerID]
      @user.paypal_payment_token = params[:token]
      @user.email = @user.paypal.checkout_details.email
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save_with_payment
      login(params[:user][:email], params[:user][:password])
      redirect_to profile_path(@user), :notice => "Welcome to Visitorr! Please take a moment to fill in your information. This information will be sent to your visitors!"
    else
      render :new
    end
  end
  
  def edit
    @user = current_user
    if @user.subscribed == false
      if params[:plan_id]
        @user.plan_id = params[:plan_id]
      else
        redirect_to update_plans_path
      end
    end
    if params[:PayerID]
      @user = current_user
      @user.update_with_paypal(params[:token], params[:PayerID])
      redirect_to settings_url, :notice => "Your subscription has been updated! We knew you'd be back."
    end
  end
  
  def update
    @user = current_user      
    if @user.update_attributes(params[:user])
      redirect_to settings_path, :notice => "Profile Updated!"
    else 
      redirect_to settings_path, :notice => "I'm sorry, that didn't save. Please try again."
    end
  end

  def cancel_subscription
    if @user = current_user
      if @user.paypal_recurring_profile_token.present?
        @user.paypal.cancel_recurring
        @user.update_attributes(:subscribed => false, :paypal_recurring_profile_token => nil)
        redirect_to settings_path, :notice => "Your subscription has been cancelled."
      else
        cu = Stripe::Customer.retrieve(@user.stripe_customer_token)
        if cu.cancel_subscription
          @user.update_attributes(:subscribed => false, :last_4_digits => "")
          redirect_to settings_path, :notice => "You'll be back.. they always come back"
        end
      end
    end
  end
  
  def failed_payment
    @user = User.find_by_stripe_id(params[:invoice][:customer])
    @event = params[:invoice][:event]
    if @event == "recurring_payment_failed"
      @user.update_attributes(:subscribed => false, :last_4_digits => nil)
    end
  end
  
  def paypal_checkout
    plan = Plan.find(params[:plan_id])
    @user = current_user || plan.users.build 
    if current_user
      redirect_to @user.paypal.checkout_url(
      return_url: settings_url(:plan_id => plan.id),
      cancel_url: settings_url)
    else
      redirect_to @user.paypal.checkout_url(
      return_url: new_user_url(:plan_id => plan.id),
      cancel_url: root_url)
    end
  end  
end
