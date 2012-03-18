class WelcomeJob < Struct.new(:visitor_id)
  def perform
    VisitorMailer.welcome_mailer(visitor_id).deliver
  end
end
