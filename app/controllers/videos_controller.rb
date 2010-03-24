class VideosController < ApplicationController
  # GET /videos
  # GET /videos.xml
  VIDS_PER_PAGE = 10
  def index
    @title = _("Videos")
    @videos = Video.paginate :page => params[:page], :per_page => VIDS_PER_PAGE
    @videos_by_hits_monthly = Video.paginate :page => params[:page_by_hits], :per_page => VIDS_PER_PAGE,
      :order=>"hits DESC"
    @videos_by_hits_weekly = Video.paginate :page => params[:page_by_hits], :per_page => VIDS_PER_PAGE,
      :order=>"hits DESC", :conditions => ["created_at > ?", Time.now-7.days]
    @videos_by_hits_daily = Video.paginate :page => params[:page_by_hits], :per_page => VIDS_PER_PAGE,
      :order=>"hits DESC", :conditions => ["created_at > ?", Time.now-24.hours]

    respond_to do |format|
      format.html # index.html.erb
      format.js  { render :layout => false }
    end
  end

  # GET /videos/1
  # GET /videos/1.xml
  def show
    @video = Video.find(params[:id])
    @video.hit!
    @last5 = Video.find :all, :limit => 5
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @video }
    end
  end

  # GET /videos/new
  # GET /videos/new.xml
  def new
    @video = Video.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @video }
    end
  end

  # GET /videos/1/edit
  def edit
    @video = Video.find(params[:id])
  end

  # POST /videos
  # POST /videos.xml
  def create
    @video = Video.new(params[:video])
    @video.user_id = current_user.id
    respond_to do |format|
      if @video.save
        flash[:notice] = 'Video was successfully created.'
        format.html { redirect_to(@video) }
        format.xml  { render :xml => @video, :status => :created, :location => @video }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @video.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /videos/1
  # PUT /videos/1.xml
  def update
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video])
        flash[:notice] = 'Video was successfully updated.'
        format.html { redirect_to(@video) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @video.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.xml
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to(videos_url) }
      format.xml  { head :ok }
    end
  end
end
