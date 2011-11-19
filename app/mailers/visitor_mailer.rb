class VisitorMailer < ActionMailer::Base
  default from: "visitorr@example.com"

  def welcome_mailer(visitorr)
    @user = User.find_by_id(visitorr.user_id)
    visitorr.update_attributes(:welcomed => true) if mail(:to => visitorr.email, :subject => "Welcome to #{@user.name} ")  
  end
end
