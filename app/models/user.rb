class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_unique_slug :column => :slug, :subject => :name

  before_save :make_slug
  has_many :visitors, :dependent => :destroy
  has_one :profile, :dependent => :destroy
  belongs_to :plan
    
  attr_accessor :stripe_card_token, :paypal_payment_token

  attr_accessible :email, :password, :password_confirmation, :name, :stripe_token, :last_4_digits, :subscribed, :stripe_customer_token, :stripe_card_token, :paypal_customer_token, :paypal_payment_token, :paypal_recurring_profile_token, :plan_id

  validates_confirmation_of   :password
  validates_presence_of       :password, :on => :create
  validates_uniqueness_of     :name, :slug
  validates_format_of         :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i

  validates :email, :uniqueness => { :case_sensitive => false },
                    :presence => true

  validates :name,  :uniqueness => { :case_sensitive => false },
                    :presence => true

  validates :slug,  :uniqueness => { :case_sensitive => false }
  
  def save_with_payment
    if valid?
      if paypal_payment_token.present?
        save_with_paypal_payment
      else
        save_with_stripe_payment
      end
    end
  end
  
  def save_with_paypal_payment
    response = paypal.make_recurring
    self.paypal_recurring_profile_token = response.profile_id
    self.subscribed = true
    save!
  end
  
  def update_with_paypal(token, payerid)
    self.paypal_payment_token = token
    self.paypal_customer_token = payerid
    response = paypal.make_recurring
    self.paypal_recurring_profile_token = response.profile_id
    self.subscribed = true
    save!
  end
  
  def paypal
    PaypalPayment.new(self)
  end
  
  def save_with_stripe_payment
      customer = Stripe::Customer.create(:description => email, :plan => plan_id, :card => stripe_card_token)
      self.stripe_customer_token = customer.id
      self.subscribed = true
      self.last_4_digits = customer.active_card.last4
      save!
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
  
  def update_with_stripe
    customer = Stripe::Customer.retrieve(stripe_customer_token)
    customer.card = stripe_token
    customer.save
    self.subscribed = true
    self.last_4_digits = customer.active_card.last4
    save!
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
  false
  end

  def make_slug
    self.slug = self.name.parameterize
  end
  
  def payment_provided?
    stripe_card_token.present? || paypal_payment_token.present? 
  end
  
  
  # before_save :update_stripe  
  # attr_accessor :stripe_token
  
  # 
  # def update_stripe
  #   if stripe_token.present?
  #     if stripe_id.nil?
  #       customer = Stripe::Customer.create(
  #         :description => email,
  #         :card => stripe_token
  #       )
  #       self.last_4_digits = customer.active_card.last4
  #       response = customer.update_subscription({:plan => "Visitorr+"})
  #     else
  #       customer = Stripe::Customer.retrieve(stripe_id)
  #       customer.card = stripe_token
  #       customer.save
  #       self.last_4_digits = customer.active_card.last4
  #     end
  # 
  #     self.stripe_id = customer.id
  #     self.stripe_token = nil
  #     self.subscribed = true
  #   elsif last_4_digits_changed?
  #     self.last_4_digits = last_4_digits_was
  #   end
  #   rescue Stripe::InvalidRequestError => e  
  # logger.error "Stripe error while creating customer: #{e.message}"  
  # errors.add :base, "There was a problem with your credit card." 
  # end
  
end
