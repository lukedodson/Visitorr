class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_unique_slug :column => :slug, :subject => :name

  has_many :visitors

  attr_accessible :email, :password, :password_confirmation, :name

  validates_confirmation_of   :password
  validates_presence_of       :password, :on => :create
  validates_presence_of       :email
  validates_uniqueness_of     :email

end
