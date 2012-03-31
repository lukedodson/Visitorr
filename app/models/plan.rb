class Plan < ActiveRecord::Base
  has_many :users
end

# == Schema Information
#
# Table name: plans
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  price       :decimal(, )
#  email_limit :integer
#  created_at  :datetime
#  updated_at  :datetime
#

