class TopicsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  before_filter :find_forum_and_topic, :except => :index

  def index
  end

  def new
    @topic = Topic.new
  end

  def show
    @title = @topic.title
    respond_to do |format|
      format.html do
        # see notes in application.rb on how this works
        # update_last_seen_at
        # keep track of when we last viewed this topic for activity indicators
        (session[:topics] ||= {})[@topic.id] = Time.now.utc if logged_in?
        # authors of topics don't get counted towards total hits
        @topic.hit! unless logged_in? and @topic.user == current_user
        @comments = Comment.paginate(:page => params[:page], :per_page => 25, :order => 'comments.created_at DESC', :include => :user, :conditions => ['comments.topic_id = ?', params[:id]])
        @comment   = Comment.new
      end
      format.xml do
        render :xml => @topic.to_xml
      end
      format.rss do
        @comments = @topic.comments.find(:all, :order => 'created_at desc', :limit => 25)
        render :action => 'show.rxml', :layout => false
      end
    end
  end


  def create
    @topic  = @forum.topics.build(params[:topic])
    @topic.user = current_user
    # only save topic if post is valid so in the view topic will be a new record if there was an error
    @topic.save!
    respond_to do |format|
      format.html { redirect_to topic_path(@forum, @topic) }
      format.xml  { head :created, :location => formatted_topic_url(:forum_id => @forum, :id => @topic, :format => :xml) }
    end
  end


  def update
  end

  def destroy
  end
  
  protected
  def find_forum_and_topic
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.find(params[:id]) if params[:id]
  end


end
