class VisitorsController < ApplicationController
  def new
    @user = User.find params[:id]
    if @user.nil?
      redirect_to root_url, :notice => "Great news everyone! This organization doesn't exist yet! Why don't you create it?"
    else
      @visitor = @user.visitors.new
    end
  end

  def create
    @user = User.find_by_id(params[:visitor][:user_id])
    @visitor = @user.visitors.build(params[:visitor])
    if @visitor.save
      @visitor.update_attributes(:welcomed => true) if VisitorMailer.welcome_mailer(@visitor).deliver
      redirect_to success_path, :notice => "Success! You will be contacted shortly!"
    else
      redirect_to visitors_new_path, :notice => "Something went wrong.."
    end
  end

  def success
  end

end
