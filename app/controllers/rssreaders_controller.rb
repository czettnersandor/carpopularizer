class RssreadersController < ApplicationController
  before_filter :check_administrator_role, :except => [ :show ]
  # GET /rssreaders
  # GET /rssreaders.xml
  def index
    @rssreaders = Rssreader.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rssreaders }
    end
  end

  # GET /rssreaders/1
  # GET /rssreaders/1.xml
  def show
    @rssreader = Rssreader.find(params[:id])
    @title = @rssreader.name

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rssreader }
    end
  end

  # GET /rssreaders/new
  # GET /rssreaders/new.xml
  def new
    @rssreader = Rssreader.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rssreader }
    end
  end

  # GET /rssreaders/1/edit
  def edit
    @rssreader = Rssreader.find(params[:id])
  end

  # POST /rssreaders
  # POST /rssreaders.xml
  def create
    @rssreader = Rssreader.new(params[:rssreader])

    respond_to do |format|
      if @rssreader.save
        flash[:notice] = 'Rssreader was successfully created.'
        format.html { redirect_to(@rssreader) }
        format.xml  { render :xml => @rssreader, :status => :created, :location => @rssreader }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rssreader.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rssreaders/1
  # PUT /rssreaders/1.xml
  def update
    @rssreader = Rssreader.find(params[:id])

    respond_to do |format|
      if @rssreader.update_attributes(params[:rssreader])
        flash[:notice] = 'Rssreader was successfully updated.'
        format.html { redirect_to(@rssreader) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rssreader.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rssreaders/1
  # DELETE /rssreaders/1.xml
  def destroy
    @rssreader = Rssreader.find(params[:id])
    @rssreader.destroy

    respond_to do |format|
      format.html { redirect_to(rssreaders_url) }
      format.xml  { head :ok }
    end
  end
end
