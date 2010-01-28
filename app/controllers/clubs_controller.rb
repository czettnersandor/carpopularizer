class ClubsController < ApplicationController

  def index
    @clubs = Club.paginate(:page => params[:page], :per_page => 25, :order => 'created_at DESC',
      :conditions => gen_conditions(params, Club))
  end

  def show
    @club = Club.find(params[:id])
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(params[:club])

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

  end

  def destroy

  end

end
