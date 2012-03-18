class Visitor < ActiveRecord::Base
  belongs_to :visitor

  validates_presence_of :name, :email
  validates_format_of   :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i

end
