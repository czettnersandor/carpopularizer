class ImagesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    @user = User.find(params[:user_id])
    @gallery = Gallery.find(params[:gallery_id])
    
    @images = params[:image].values.collect { |image|
      newimage = Image.new(image)
      newimage.gallery = @gallery
      newimage
    }

    if @images.all?(&:valid?)
      @images.each(&:save!)
      redirect_to(user_gallery_path(@user, @gallery))
    else
      render :action => 'new'
    end
  end
    

  def edit
    @user = User.find(params[:user_id])
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.find(params[:id])
    respond_to do |format|
      # format.html { redirect_to(user_gallery_path(params[:user_id], params[:gallery_id])) }
      format.js  { render :layout  => false }
      format.xml  { head :ok }
      
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
