class ContactMailer < ActionMailer::Base

  def contact_us(contact)
    @contact = contact
    mail(:to => "visitorrdev@gmail.com", :subject => "New message from Visitorr", :from => contact.email)
  end
end
