class VisitorMailer < ActionMailer::Base
  default from: "visitorr@example.com"

  def welcome_mailer(visitorr)
    @user = User.find_by_id(visitorr.user_id)
    mail(:to => @user.email, :subject => "Welcome to #{@user.name} ")
  end
end
