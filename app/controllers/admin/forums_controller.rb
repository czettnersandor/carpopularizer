class Admin::ForumsController < ApplicationController
  before_filter :find_or_initialize_forum, :except => :index
  def index
    @forums = Forum.find(:all, :order => "updated_at DESC")
    # reset the page of each forum we have visited when we go back to index
    session[:forum_page]=nil
  end

  def new
  end

  def edit
  end

  def create
    @forum.attributes = params[:forum]
    @forum.save!
    respond_to do |format|
      format.html { redirect_to forums_path }
      format.xml  { head :created, :location => formatted_forum_url(:id => @forum, :format => :xml) }
    end
  end

  def update
    @forum.update_attributes!(params[:forum])
    respond_to do |format|
      format.html { redirect_to admin_forums_path }
      format.xml  { head 200 }
    end
  end

  def destroy
    @forum.destroy
    respond_to do |format|
      format.html { redirect_to admin_forums_path }
      format.xml  { head 200 }
    end
  end


  protected
  def find_or_initialize_forum
    @forum = params[:id] ? Forum.find(params[:id]) : Forum.new
  end

end
