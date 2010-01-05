class FrontController < ApplicationController

  def index
    @roles = current_user.roles
  end

end
