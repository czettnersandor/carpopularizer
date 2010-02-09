class BattlesController < ApplicationController

  def index
    # called from user's profile
    if params[:user_id]
      user_index
    else
      @title = "Choose battle type!"
    end

  end

  def user_index
    @user = User.find params[:user_id]
    @title = ("%s » "+_("Ride Battles")) % @user.login
    @combats = Array.new
    @user.cars.each do |car|
      @combats += car.all_combats
    end
    render :action => :user_index
  end
  
end
