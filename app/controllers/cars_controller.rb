class CarsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @car = Car.new
    @title = _('New car')
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @car }
    end
  end

  def create
    @user = User.find(params[:user_id])
    @car = Car.new(params[:car])
    @car.user = @user
    respond_to do |format|
      if @car.save
        flash[:notice] = _('Car was successfully created.')
        format.html { redirect_to(user_car_path(@user, @car)) }
        format.xml  { render :xml => @car, :status => :created, :location => @car }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @car.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
