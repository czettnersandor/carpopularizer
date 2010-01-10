class CommentsController < ApplicationController
  def index
  end

  def edit
  end

  def create
    @topic = Topic.find_by_id_and_forum_id(params[:topic_id],params[:forum_id], :include => :forum)
    if @topic.locked?
      respond_to do |format|
        format.html do
          flash[:notice] = 'This topic is locked.'
          redirect_to(topic_path(:forum_id => params[:forum_id], :id => params[:topic_id]))
        end
        format.xml do
          render :text => 'This topic is locked.', :status => 400
        end
      end
      return
    end
    @forum = @topic.forum
    @comment  = @topic.comments.build(params[:comment])
    @comment.user = current_user
    @comment.save!
    respond_to do |format|
      format.html do
        redirect_to topic_path(:forum_id => params[:forum_id], :id => params[:topic_id])
      end
      format.xml { head :created, :location => formatted_comment_url(:forum_id => params[:forum_id], :topic_id => params[:topic_id], :id => @comment, :format => :xml) }
    end
  rescue ActiveRecord::RecordInvalid
    flash[:bad_reply] = 'Please post something at least...'
    respond_to do |format|
      format.html do
        redirect_to topic_path(:forum_id => params[:forum_id], :id => params[:topic_id], :anchor => 'reply-form', :page => params[:page] || '1')
      end
      format.xml { render :xml => @comment.errors.to_xml, :status => 400 }
    end
  end


end
