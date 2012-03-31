class Profile < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :address, :phone, :video_url, :subject, :body
  
  validates_presence_of :subject, :body
  
  
end
