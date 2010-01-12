class FrontController < ApplicationController

  def index
    if logged_in?
      @roles = current_user.roles  
    end
    @title = "Főoldal"
  end

end
