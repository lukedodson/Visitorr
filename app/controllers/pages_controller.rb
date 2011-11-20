class PagesController < ApplicationController

  def home
    render :layout => "landing_page.html.erb"
  end
end
