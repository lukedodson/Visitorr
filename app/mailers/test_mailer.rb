class TestMailer < ActionMailer::Base  
  default from: "visitorr@example.com"

  def test(user)
    @user = User.find_by_id(user.id)
    @subject = @user.profile.subject || "Welcome to #{@user.name}"
    mail(:to => user.email, :subject => @subject, :from => @user.email)  
  end
end
