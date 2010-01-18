class GalleriesController < ApplicationController
  session :cookie_only => false, :only => :create
  def index
    @user = User.find(params[:user_id])
    @title = _("#{@user.login}'s galleries")
    @galleries = Gallery.find_all_by_user_id(@user.id)
  end

  def show
    @user = User.find(params[:user_id])
    @gallery = Gallery.find(params[:id])
    @title = @gallery.title
  end

  def new
    @user = User.find(params[:user_id])
    @gallery = Gallery.new
  end

  def create
    @user = User.find(params[:user_id])
    @gallery = Gallery.new(params[:gallery])
    @gallery.user = @user

    respond_to do |format|
      if @gallery.save
        flash[:notice] = _('Gallery was successfully created.')
        format.html { redirect_to(user_gallery_path(@user, @gallery)) }
        format.xml  { render :xml => @gallery, :status => :created, :location => @gallery }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update

  end

  def destroy
    
  end

end
