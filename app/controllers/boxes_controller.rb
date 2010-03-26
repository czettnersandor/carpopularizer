class BoxesController < ApplicationController

  before_filter :preloaders, :except => [:index, :new, :create]
  before_filter :login_required, :except => [ :index, :show ]

  def index
    @user = User.find(params[:user_id], :include => "cars")
    @cars = @user.cars
  end

  def show
    @title = @user.login+" » "+@template.genre(@car.genre)+" "+@car.name
    @comments = Carcomment.paginate(:page => params[:page], :per_page => 25,
      :order => 'carcomments.created_at DESC', :include => :user,
      :conditions => ['carcomments.car_id = ?', @car.id])
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
      if @user.cars.count <= 3 && @car.save
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
    @title = _("Edit car")+" » "+@car.name
    @equipment = Equipment.find_by_car_id @car.id
  end

  def update
    respond_to do |format|
      if @car.update_attributes(params[:car])
        @equipment = Equipment.find_or_create_by_car_id(@car)
        @equipment.update_attributes!(params[:car][:equipment])
        @car.equipment = @equipment
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
    @comment.user_id = current_user.id
    @comment.car_id = @car.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(user_box_path(@user, @car)) }
        format.xml  { render :xml => @car, :status => :created, :location => @car }
      else
        format.html { }
        format.xml  { render :xml => @car.errors, :status => :unprocessable_entity }
      end
    end
  end

  def rate
    @car.rate(params[:stars], current_user, params[:dimension])
    id = "ajaxful-rating-#{!params[:dimension].blank? ? "#{params[:dimension]}-" : ''}article-#{@car.id}"
    render :update do |page|
      page.replace_html id, ratings_for(@car, :wrap => false,
        :remote_options => {:url => rate_user_box_path(@user, @car)})
      # page.visual_effect :highlight, id
    end
  end


  protected
  def preloaders
    @car = Car.find(params[:id])
    @user = @car.user
    
  end

end
