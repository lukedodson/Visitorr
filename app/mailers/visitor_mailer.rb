class VisitorMailer < ActionMailer::Base
  default from: "visitorr@example.com"

  def welcome_mailer(visitor)
    visitorr = Visitor.find_by_id(visitor)
    @user = User.find_by_id(visitorr.user_id)
    @subject = @user.profile.subject || "Welcome to #{@user.name}"
    visitorr.update_attributes(:welcomed => true) if mail(:to => visitorr.email, 
    :subject => @subject, :from => @user.email)  
  end
end
