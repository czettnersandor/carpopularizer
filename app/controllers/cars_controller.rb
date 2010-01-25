class CarsController < ApplicationController
  def index
    @cars = Car.paginate(:page => params[:page], :per_page => 25)
  end

end
