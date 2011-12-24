class PasswordResetsMailer < ActionMailer::Base
  default :from => "reset.password@visitorr.com"
  
  def reset_password_email(user)
    @user = user
    # change for live
    @url = "http://localhost:3000/password_resets/#{user.reset_password_token}/edit"
    mail(:to => user.email, :subject => "Your password reset request")
  end
end