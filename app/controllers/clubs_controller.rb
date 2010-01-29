class ClubsController < ApplicationController

  def index
    @clubs = Club.paginate(:page => params[:page], :per_page => 25, :order => 'created_at DESC',
      :conditions => gen_conditions(params, Club))
  end

  def show
    @club = Club.find(params[:id])
    @title = @club.name
  end

  def new
    @club = Club.new
  end

  def edit
    @club = Club.find(params[:id])
  end

  def create
    @club = Club.new(params[:club])
    @club.user = current_user
    respond_to do |format|
      if @club.save
        flash[:notice] = _('Club was successfully created.')
        format.html { redirect_to(@club) }
        format.xml  { render :xml => @club, :status => :created, :location => @club }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @club.errors, :status => :unprocessable_entity }
      end
    end

  end

  def update
    @club = Club.find(params[:id])

    respond_to do |format|
      if @club.update_attributes(params[:club])
        flash[:notice] = _('Club was successfully updated.')
        format.html { redirect_to(@club) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @club.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy

  end

end
