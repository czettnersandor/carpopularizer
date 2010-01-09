class UsersController < ApplicationController

  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save!
    if @user.errors.empty?
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
    end
    redirect_back_or_default('/')
  end



end
