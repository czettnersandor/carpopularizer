class GalleriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @title = _("%s's galleries") % @user.login
    @galleries = Gallery.find_all_by_user_id(@user.id)
    redirect_to user_gallery_path(@user, @galleries.first) if @galleries.first

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

  def edit
    @user = User.find(params[:user_id])
    @gallery = Gallery.find(params[:id])
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
    @user = User.find(params[:user_id])
    @gallery = Gallery.find(params[:id])
    @gallery.update_attributes(params[:gallery])
    redirect_to(user_gallery_path(@user, @gallery))
  end

  def destroy
    @user = User.find(params[:user_id])
    @gallery = Gallery.find(params[:id])
    @gallery.images.each { |image| image.destroy }
    @gallery.destroy
    redirect_to(user_galleries_path(@user))
  end

end
