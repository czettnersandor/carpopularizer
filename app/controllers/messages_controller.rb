class MessagesController < ApplicationController
  def index
    @user = User.find params[:user_id], :include => [:messages]
    @received = @user.messages
    @sent = @user.messages_sent
    @title = _("Messages")
  end

  def show
    @message = Message.find(params[:id])
    @message.visit(current_user)
    @user = @message.user
    @title = _("Messages")
  end

  def new
    @message = Message.new
    respond_to do |format|
      format.js {render :layout => false}
      format.html {}
    end
  end

  def update
  end

  def create
    @message = Message.new(params[:message])
    @message.sender_id = current_user.id
    @message.user_id = params[:user_id]
    @message.status = 'new'

    respond_to do |format|
      if @message.save
        flash[:notice] = _('Your message sent.')
        format.html { redirect_to(user_path(params[:user_id])) }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
  end

end
