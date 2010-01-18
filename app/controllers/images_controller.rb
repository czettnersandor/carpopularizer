class ImagesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    @user = User.find(params[:user_id])
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new(params[:image])
    @image.gallery = @gallery
    respond_to do |format|
      if @image.save
        flash[:notice] = 'Image was successfully uploaded.'
        format.html {
          # redirect_to(user_gallery_path(@user, @gallery))
          render :text => "1"
        }
        format.js {
          render :text => "1"
        }
        format.xml  { render :xml => @image, :status => :created, :location => @image }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.find(params[:id])
    respond_to do |format|
      format.html { redirect_to(user_gallery_path(params[:user_id], params[:gallery_id])) }
      format.xml  { head :ok }
      format.js  { render :layout  => false }
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to(user_gallery_path(params[:user_id], params[:gallery_id])) }
      format.xml  { head :ok }
      format.js  { render :text => "Succesfully deleted" }
    end
  end

  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        flash[:notice] = 'Image was successfully updated.'
        format.html { redirect_to(user_gallery_path(@image.gallery.user_id, @image.gallery_id)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rssreader.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Set passed-in order for passed-in ids.
  def sort
    order = params[:image]
    Image.order(order)
    render :text => order.inspect
  end

end
