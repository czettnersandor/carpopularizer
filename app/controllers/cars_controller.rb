class CarsController < ApplicationController
  
  def index
    @title = _("Cars")
    @cars = Car.paginate(:page => params[:page], :per_page => 25, :order => 'created_at DESC',
      :conditions => gen_conditions(params, Car), :include => [:carimages, :user])

    @top5 = Car.top5

    @searchy = ""
    [1900..Time.now.year].each do |s_year|
      @searchy += "<option value=#{s_year}>#{s_year}</option>"
    end
  end

end
