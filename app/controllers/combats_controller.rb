class CombatsController < ApplicationController

  def new
    @title = _("Invite to a combat")
    @car = Car.find(params[:box_id])
    @user = @car.user
    @mycars = Hash.new
    current_user.cars.each do |car|
      @mycars[car.name] = car.id
    end
    @combat = Combat.new
  end

end
