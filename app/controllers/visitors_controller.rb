class VisitorsController < ApplicationController
 has_mobile_fu
  
  def new
    #@user = User.find_by_slug(params[:id])
    @user = User.find_by_id(params[:user_id])
    if @user.nil?
      redirect_to root_url, 
        :notice => "Great news everyone! This organization doesn't exist yet! Why don't you create it?"
    else
      @visitor = @user.visitors.new
      @profile = Profile.find_by_user_id(@user.id)
    end
  end

  def create
    @user = User.find_by_id(params[:visitor][:user_id])
    @visitor = @user.visitors.build(params[:visitor])
    @profile = Profile.find_by_user_id(@user.id)
    if @visitor.save
       #Delayed::Job.enqueue(WelcomeJob.new(@visitor), :run_at => 1.day.from_now)
       VisitorMailer.welcome_mailer(@visitor).deliver
      redirect_to success_path, :notice => "Success! You will be contacted shortly!"
    else
      render :new
    end
  end

  def destroy
    @visitor = Visitor.find_by_id(params[:id])
    if @visitor.destroy
      redirect_to admin_path, :notice => "Visitor has been deleted"
    else
      render admin_path, :notice => "Destroy failed"
    end
  end

  def success
    @user = current_user
  end
  
  def show
    
  end
end
