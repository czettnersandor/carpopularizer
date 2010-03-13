class CarsController < ApplicationController
  
  def index
    @title = _("Cars")
    per_page = params[:items]? params[:items] : 25
    @cars = Car.paginate(:page => params[:page], :per_page => per_page, :order => 'created_at DESC',
      :conditions => gen_conditions(params, Car), :include => [:carimages, :user])

    @top5 = Car.top5

    @searchy = '<option value="">--</option>'
    (1900..Time.now.year.to_i).each do |s_year|
      @searchy += "<option value=#{s_year}>#{s_year}</option>"
    end
  end

end
