  require "development_mail_interceptor"
Visitorr::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
  
  # development test settings - lukedodson@gmail.com
  Stripe.api_key = "3JeOUAMyRSOA19bV9AEZHR9qtvBU7SJS"
  STRIPE_PUBLIC_KEY = "pk_yBQGz2OLWCiagaeAMDIMeXuXCBHC6"
  

  ActionMailer::Base.smtp_settings = {  
    :address              => "smtp.gmail.com",  
    :port                 => 587,  
    :domain               => "gmail.com",  
    :user_name            => "visitorrdev@gmail.com",  
    :password             => "lukedodson",  
    :authentication       => "plain",  
    :enable_starttls_auto => true  
  }  

  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) 
  
  PayPal::Recurring.configure do |config|
    config.sandbox = true
    config.username = "mercha_1322029739_biz_api1.representativestrategies.com"
    config.password = "1322029777"
    config.signature = "ATwVOlj-u4B.C8BxuGYLRapce8kUA9poCNL-EemM1wFiw0x82go9SGmb"
  end
end
