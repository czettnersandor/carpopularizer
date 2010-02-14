class RssnewsController < ApplicationController
  # GET /rssnews
  # GET /rssnews.xml
  def index
    @rssnews = Rssnews.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rssnews }
    end
  end

  # GET /rssnews/1
  # GET /rssnews/1.xml
  def show
    @rssnew = Rssnews.find(params[:id])
    @rssnew.hit!
    redirect_norel @rssnew.link
  end

  # GET /rssnews/new
  # GET /rssnews/new.xml
  def new
    @rssnew = Rssnews.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rssnew }
    end
  end

  # GET /rssnews/1/edit
  def edit
    @rssnew = Rssnews.find(params[:id])
  end

  # POST /rssnews
  # POST /rssnews.xml
  def create
    @rssnew = Rssnews.new(params[:rssnew])

    respond_to do |format|
      if @rssnew.save
        flash[:notice] = 'Rssnew was successfully created.'
        format.html { redirect_to(@rssnew) }
        format.xml  { render :xml => @rssnew, :status => :created, :location => @rssnew }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rssnew.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rssnews/1
  # PUT /rssnews/1.xml
  def update
    @rssnew = Rssnews.find(params[:id])

    respond_to do |format|
      if @rssnew.update_attributes(params[:rssnew])
        flash[:notice] = 'Rssnew was successfully updated.'
        format.html { redirect_to(@rssnew) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rssnew.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rssnews/1
  # DELETE /rssnews/1.xml
  def destroy
    @rssnew = Rssnews.find(params[:id])
    @rssnew.destroy

    respond_to do |format|
      format.html { redirect_to(rssnews_url) }
      format.xml  { head :ok }
    end
  end
end
