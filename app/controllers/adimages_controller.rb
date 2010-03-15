class AdimagesController < ApplicationController
  def new
    @ad = Advert.find(params[:marketplace_id])
    @image = Carimage.new
    respond_to do |format|
      format.html  { }
      format.js  { render :layout  => false }
      format.xml  { head :ok }
    end
  end

  def create
    @ad = Advert.find(params[:marketplace_id])

    @images = params[:image].values.collect { |image|
      newimage = Carimage.new(image)
      newimage.advert = @ad
      newimage
    }

    if @images.all?(&:valid?)
      @images.each(&:save!)
      redirect_to(marketplace_path(@ad))
    else
      render :action => 'new'
    end
  end


  def edit
    @ad = Advert.find(params[:marketplace_id])
    @image = Carimage.find(params[:id])
    respond_to do |format|
      format.html  { }
      format.js  { render :layout  => false }
      format.xml  { head :ok }
    end
  end

  def destroy
    @image = Carimage.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to(marketplace_path(params[:marketplace_id])) }
      format.xml  { head :ok }
      format.js  { render :text => "Succesfully deleted" }
    end
  end

  def update
    @image = Carimage.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:carimage])
        flash[:notice] = 'Image was successfully updated.'
        format.html { redirect_to(marketplace_path(@image.advert_id)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Set passed-in order for passed-in ids.
  def sort
    order = params[:item]
    Carimage.order(order)
    render :text => order.inspect
  end
end
