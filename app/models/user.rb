class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_unique_slug :column => :slug, :subject => :name
  before_save :update_stripe
  before_save :make_slug
  has_many :visitors, :dependent => :destroy
  
  attr_accessor :stripe_token

  attr_accessible :email, :password, :password_confirmation, :name, :stripe_token, :last_4_digits

  validates_confirmation_of   :password
  validates_presence_of       :password, :on => :create
  validates_uniqueness_of     :name, :slug

  validates :email, :uniqueness => { :case_sensitive => false },
                    :presence => true

  validates :name,  :uniqueness => { :case_sensitive => false },
                    :presence => true

  validates :slug,  :uniqueness => { :case_sensitive => false },
                    :presence => true

  def update_stripe
    if stripe_token.present?
      if stripe_id.nil?
        customer = Stripe::Customer.create(
          :description => email,
          :card => stripe_token
        )
        self.last_4_digits = customer.active_card.last4
        response = customer.update_subscription({:plan => "Visitorr+"})
      else
        customer = Stripe::Customer.retrieve(stripe_id)
        customer.card = stripe_token
        customer.save
        self.last_4_digits = customer.active_card.last4
      end

      self.stripe_id = customer.id
      self.stripe_token = nil
      self.subscribed = true
    elsif last_4_digits_changed?
      self.last_4_digits = last_4_digits_was
    end
    rescue Stripe::InvalidRequestError => e  
  logger.error "Stripe error while creating customer: #{e.message}"  
  errors.add :base, "There was a problem with your credit card." 
  end

  def make_slug
    self.slug = self.name.parameterize
  end
end
