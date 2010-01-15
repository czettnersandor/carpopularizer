class ProfileController < ApplicationController
  include GeoKit::Geocoders
  include GeoKit::Mappable
  before_filter :login_required
  def index
    @user = current_user

    if @user.city && @user.address
      coordinates = GoogleGeocoder.geocode(@user.zip+' '+@user.city+' '+@user.address)
    
      @map = GMap.new("map")
      @map.center_zoom_init([coordinates.lat, coordinates.lng], 14)
      ianazones = GMarker.new([coordinates.lat, coordinates.lng])
      @map.overlay_init(ianazones)
    end
  end

  def edit
    @user = current_user
    render :template => "profile/edit-user"
  end

  def update
    @user = User.find(current_user)
    if @user.update_attributes(params[:user])
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
      # flash[:notice] = _('User profile was succesfully updated.')
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end
end
