class CarsController < ApplicationController
  
  def index
    @title = _("Cars")
    @cars = Car.paginate(:page => params[:page], :per_page => 25, :order => 'created_at DESC',
      :conditions => gen_conditions(params, Car), :include => [:carimages, :user])

    @top5 = Car.top5
  end

end
