class ForumsController < ApplicationController
  before_filter :login_required, :except => [ :index, :show ]
  before_filter :find_or_initialize_forum, :except => :index

  def index
    @forums = Forum.paginate :page => params[:page], :order => "updated_at DESC", :per_page => 10
    # reset the page of each forum we have visited when we go back to index
    session[:forum_page]=nil
    respond_to do |format|
      format.html
      format.xml { render :xml => @forums.to_xml }
    end
  end

  def show
    respond_to do |format|
      format.html do
        # keep track of when we last viewed this forum for activity indicators
        (session[:forums] ||= {})[@forum.id] = Time.now.utc if logged_in?
        (session[:forum_page] ||= Hash.new(1))[@forum.id] = params[:page].to_i if params[:page]
        @topics = Topic.paginate :page => params[:page], :order => 'replyed_at DESC', :per_page => 10
      end
      format.xml { render :xml => @forum.to_xml }
    end
  end

  protected
  def find_or_initialize_forum
    @forum = params[:id] ? Forum.find(params[:id]) : Forum.new
  end


end
