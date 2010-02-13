# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem

  # render new.rhtml
  def new
    @title = _("Login")
    respond_to do |format|
      format.html {}
      format.js do
        @message = _("You have to log in to be able to access here... Not yet a member? "+@template.link_to(_("Register now!"), new_user_path))
        session[:return_to] = params[:redirect]
        render :layout => false
      end
    end
    
  end

  def create
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      current_user.update_last_login
      redirect_back_or_default('/')
      flash[:notice] = _("Logged in successfully")
    else
      flash[:login_message] = _("Invalid email or password")
      redirect_to :action => 'new'
    end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = _("You have been logged out.")
    redirect_back_or_default('/')
  end
end
