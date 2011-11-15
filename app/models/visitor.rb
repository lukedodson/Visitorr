class Visitor < ActiveRecord::Base
  belongs_to :visitor

  validates_presence_of :name, :email
end
