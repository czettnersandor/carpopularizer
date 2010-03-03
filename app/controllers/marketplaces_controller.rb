class MarketplacesController < ApplicationController
  before_filter :preload_data
  def index
    @title = _("Marketplaces")
    @adverts = Advert.all()
  end

  def new
    @title = _("New advert")
    @advert = Advert.new
  end

  def show
    @advert = Advert.find(params[:id])
  end

  def create
    @advert = Advert.new(params[:advert])

    respond_to do |format|
      if @advert.save
        flash[:notice] = _('Ad was successfully created.')
        format.html { redirect_to(marketplace_url(@advert)) }
        format.xml  { render :xml => @advert, :status => :created, :location => @advert }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @advert.errors, :status => :unprocessable_entity }
      end
    end
  end

  protected
  def preload_data
    @user = current_user
  end
end
