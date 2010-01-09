class ProfileController < ApplicationController
  before_filter :login_required
  def index
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user)

    if ((params[:user][:password] == params[:user][:password_confirmation]) && !params[:user][:password_confirmation].blank?)
      current_user.password_confirmation = params[:password_confirmation]
      current_user.password = params[:password]
      if current_user.save
        flash[:notice] = _("Password successfully updated.")
      else
        flash[:error] = _("An error occured, your password was not changed.")
        render :action => 'edit'
      end
    end

    if @user.update_attributes(params[:user])
      # flash[:notice] = _('User profile was succesfully updated.')
      render :action => "index"
    else
      render :action => "edit"
    end
  end
end
