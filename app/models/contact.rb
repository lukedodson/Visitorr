class Contact
  include ActiveModel::Validations
  include ActiveModel::Conversion  
  extend ActiveModel::Naming
  
  validates_presence_of :email, :name, :content
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  
  # to deal with form, you must have an id attribute
  attr_accessor :email, :name, :content

  def initialize(attributes = {})  
    attributes.each do |name, value|  
      send("#{name}=", value)  
    end  
  end
  
  def to_key
  end
  
  def persisted?  
    false  
  end
end
