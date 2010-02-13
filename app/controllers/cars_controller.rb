class CarsController < ApplicationController
  
  def index
    @cars = Car.paginate(:page => params[:page], :per_page => 25, :order => 'created_at DESC',
      :conditions => gen_conditions(params, Car))

    @top5 = Car.top5
  end

end
