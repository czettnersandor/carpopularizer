class Admin::FrontController < ApplicationController
  before_filter :check_administrator_role
  
  def index
  end

end
