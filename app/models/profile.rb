class Profile < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :address, :phone, :video_url, :subject, :body, :question_one, :question_two,
                  :question_three, :question_four, :question_five
  
  validates_presence_of :subject, :body

end


# == Schema Information
#
# Table name: profiles
#
#  id             :integer         not null, primary key
#  address        :string(255)
#  phone          :string(255)
#  video_url      :string(255)
#  subject        :string(255)
#  body           :text
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  question_one   :string(255)
#  question_two   :string(255)
#  question_three :string(255)
#  question_four  :string(255)
#  question_five  :string(255)
#

