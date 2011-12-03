class PaypalPayment
  def initialize(user)
    @user = user    
  end
  
  def make_recurring
    process :request_payment
    process :create_recurring_profile, period: :monthly, frequency: 1, start_at: Time.zone.now, trial_period: :monthly, trial_length: 1, trial_frequency: 1
  end
  
  def checkout_details
    process :checkout_details
  end
  
  def checkout_url(options)
    process(:checkout, options).checkout_url
  end
  
  def cancel_recurring
    process(:cancel, :profile_id => @user.paypal_recurring_profile_token)
  end
  
  private
  def process(action, options = {})
    options = options.reverse_merge(
      token: @user.paypal_payment_token,
      payer_id: @user.paypal_customer_token,
      description: "Visitorr+",
      amount: 9.99,
      currency: "USD"
    )
    response = PayPal::Recurring.new(options).send(action)
    raise response.errors.inspect if response.errors.present?
    response
  end
end 



