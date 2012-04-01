class ContactsController < ApplicationController
  def new
    @contact = Contact.new{}
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      ContactMailer.contact_us(@contact).deliver!
      redirect_to '/', :notice => "We have received your email. We will be in touch soon."
    else
      #render :contact_us
      flash[:notice] = "There were errors sending your message."
      render :action => "new"
      #render :contact_us
    end
  end
end
