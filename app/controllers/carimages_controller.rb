class CarimagesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @box = Car.find(params[:box_id])
    @image = Carimage.new
    respond_to do |format|
      format.html  { }
      format.js  { render :layout  => false }
      format.xml  { head :ok }
    end
  end

  def create
    @user = User.find(params[:user_id])
    @box = Car.find(params[:box_id])

    @images = params[:image].values.collect { |image|
      newimage = Carimage.new(image)
      newimage.car = @box
      newimage
    }

    if @images.all?(&:valid?)
      @images.each(&:save!)
      redirect_to(user_box_path(@user, @box))
    else
      render :action => 'new'
    end
  end


  def edit
    @user = User.find(params[:user_id])
    @box = Car.find(params[:box_id])
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
      format.html { redirect_to(user_box_path(params[:user_id], params[:box_id])) }
      format.xml  { head :ok }
      format.js  { render :text => "Succesfully deleted" }
    end
  end

  def update
    @image = Carimage.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        flash[:notice] = 'Image was successfully updated.'
        format.html { redirect_to(user_box_path(@image.car.user_id, @image.car_id)) }
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
