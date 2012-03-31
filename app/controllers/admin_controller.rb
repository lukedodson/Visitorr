require 'fastercsv'
require 'csv'

class AdminController < ApplicationController
  before_filter :require_login
  before_filter :subscribed

  def visitors
    @user = current_user
    @visitors = @user.visitors.order("created_at desc")
    if @visitors.count == 0
      flash.now.notice = "Go to your profile and setup your welcome email to allow your visitors to sign up for more information!"
    end
  end

  
  def export_emails
    @user = current_user
    @visitors = @user.visitors.order("created_at desc")
    if @visitors.count > 0
      email_csv = CSV.generate do |csv|
        csv << ["Name", "Email"]
        @visitors.each do |visitor|
          csv << [visitor.name, visitor.email]
        end
      end
      
      send_data(email_csv, :type => 'text/csv', :filename => 'visitors_emails.csv')
    end
  end
end
