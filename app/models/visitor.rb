class Visitor < ActiveRecord::Base
  belongs_to :visitor
  belongs_to :profile

  attr_accessible :name, :email
  
  validates_presence_of :name, :email

  validates_format_of   :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i

end

# == Schema Information
#
# Table name: visitors
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  welcomed   :boolean         default(FALSE)
#

