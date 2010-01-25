class BoxesController < ApplicationController

  before_filter :preloaders, :except => [:index, :new, :create]

  def index
    @user = User.find(params[:user_id])
    @cars = Car.find_all_by_user_id(params[:user_id])
  end

  def show
    @title = @user.login+" » "+@car.name
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
        format.html { redirect_to(user_box_path(@user, @car)) }
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
    respond_to do |format|
      if @car.update_attributes(params[:car])
        flash[:notice] = _('Car was successfully updated.')
        format.html { redirect_to(user_box_path(@user, @car)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @car.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def addcomment
    @comment = Carcomment.new(params[:comment])
    @comment.user_id = @user.id
    @comment.car_id = @car.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(user_box_path(@user, @car)) }
        format.xml  { render :xml => @car, :status => :created, :location => @car }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @car.errors, :status => :unprocessable_entity }
      end
    end
  end

  protected
  def preloaders
    @user = User.find(params[:user_id])
    @car = Car.find(params[:id])
  end

end
