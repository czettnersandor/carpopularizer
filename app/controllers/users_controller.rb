class UsersController < ApplicationController
  before_filter :login_required, :only => [:index, :show]
  def index
    @users = User.find :all, :conditions => "activated_at IS NOT NULL", :conditions => {:enabled => 1}
  end

  def show
    @user = User.find_by_id(params[:id])
    @title = @user.login

    # User's Google Map
    if @user.city && @user.address
      coordinates = GoogleGeocoder.geocode(@user.zip+' '+@user.city+' '+@user.address)
      @map = GMap.new("map")
      @map.control_init(:large_map => true,:map_type => true)
      @map.center_zoom_init([coordinates.lat, coordinates.lng], 14)
      ianazones = GMarker.new([coordinates.lat, coordinates.lng])
      @map.overlay_init(ianazones)
    end

    friendlist = Array.new
    @user.friendships.each do |friend|
      friendlist << friend.friend_id.to_s
    end

    @wall = Userevent.find_all_by_user_id friendlist
  end

  def edit
    @user = User.find_by_id(params[:id])
    render :template => "users/edit-dealer" if @user.usertype == 1
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(params[:user])
      if ((params[:user][:password] == params[:user][:password_confirmation]) && !params[:user][:password_confirmation].blank?)
        @usser.password_confirmation = params[:password_confirmation]
        @user.password = params[:password]
        if @user.save
          flash[:notice] = _("Password successfully updated.")
        else
          flash[:error] = _("An error occured, your password was not changed.")
          render :action => 'edit'
        end
      end
      # flash[:notice] = _('User profile was succesfully updated.')
      redirect_to @user
    else
      render :action => "edit"
    end
  end

  def new
    @title = _("Register")
    @user = User.new(params[:user])
  end

  def new_front
    @title = _("Register")
    redirect_to current_user if logged_in?
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    if verify_recaptcha(@user) && @user.save!
      # self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = _("Thanks for signing up! Please check your email to activate your account before logging in.")
    else
      render :action => 'new'
    end
  end

  def check_username
    if User.find_by_login(params['user']['login'])
      @notice = "false"
    else
      @notice = "true"
    end
    respond_to do |format|
      format.js { render :layout => false, :template => 'users/true-false' }
      format.html { render 'users/true-false' }
    end
  end
  
  def check_email
    if User.find_by_email(params['user']['email'])
      @notice = "false"
    else
      @notice = "true"
    end
    respond_to do |format|
      format.js { render :layout => false, :template => 'users/true-false' }
      format.html { render 'users/true-false' }
    end
  end

  def activate
    self.current_user = params[:activation_code].blank? ? false : User.find_by_activation_code(params[:activation_code])
    if logged_in? && !current_user.active?
      current_user.activate
      flash[:notice] = _("Signup complete!")
      redirect_to :controller => "users", :id => current_user.id, :action => "edit"
    else
      flash[:notice] = _("Invalid activation code")
      redirect_back_or_default('/')
    end
  end



end
