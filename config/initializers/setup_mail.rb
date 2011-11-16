require "development_mail_interceptor"
#ActionMailer::Base.smtp_settings = {  
#  :address              => "smtp.gmail.com",  
#  :port                 => 587,  
#  :domain               => "gmail.com",  
#  :user_name            => "visitorrdev@gmail.com",  
#  :password             => "lukedodson",  
#  :authentication       => "plain",  
#  :enable_starttls_auto => true  
#}  

ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
