class ClubsController < ApplicationController
  before_filter :preload_club, :except => [:new, :create, :index, :findclubtag, :findcarmake, :findregion]

  def index
    if params[:user_id]
      user_index
    else
      @clubs = Club.paginate(:page => params[:page], :per_page => 25, :order => 'created_at DESC',
        :conditions => gen_conditions(params, Club))
    end
    
  end

  def user_index
    @user = User.find(params[:user_id])
    @clubs = @user.clubs
    @title = _("%s » club memberships") % @user.login
    render "user_index"
  end

  def show
    @title = @club.name
    @user = @club.user
    @shouts = Shout.all_shouts(@club.id)
  end

  # Add current_user to club through memberships
  def add_user
    @user = current_user
    params[:membership] = {:club_id => @club.id, :user_id => @user.id, :status => 'pending'}
    @membership = Membership.new(params[:membership])
    if @membership.save
      flash[:notice] = _('Your membership recorded. The Club admin can accept your request. Please be patient.')
      UserMailer.deliver_member_request(@user, @club)
      redirect_to club_path(@club)
    else
      flash[:notice] = _('You are not allowed to be a member of this club')
      redirect_to club_path(@club)
    end
  end

  def accept_member
    @user = User.find(params[:user_id])
    @membership = Membership.find_by_club_id_and_user_id(@club.id, @user.id)
    @membership.status = "accepted"
    if @membership.save
      flash[:notice] = _('Membership accepted')
      UserMailer.deliver_member_accept(@user, @club)
      redirect_to club_path(@club)
    else
      flash[:notice] = _('Cannot accept membership')
      redirect_to club_path(@club)
    end
  end

  def remove_member
    @user = User.find(params[:user_id])
    @membership = Membership.find_by_club_id_and_user_id(@club.id, @user.id)
    if @membership.destroy
      flash[:notice] = _('Membership deleted')
      UserMailer.deliver_member_destroy(@user, @club)
      redirect_to club_path(@club)
    else
      flash[:notice] = _('Cannot remove member')
      redirect_to club_path(@club)
    end
  end

  def new
    @club = Club.new
  end

  def edit
  end

  def create
    @club = Club.new(params[:club])
    @club.user = current_user
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
    respond_to do |format|
      if @club.update_attributes(params[:club])
        flash[:notice] = _('Club was successfully updated.')
        format.html { redirect_to(@club) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @club.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @club.destroy
    respond_to do |format|
      format.html { redirect_to(clubs_url) }
      format.xml  { head :ok }
    end
  end

  def findclubtag
    if params[:q]
      @tags = Tag.named_like(params[:q])
    else
      @tags = Tag.all
    end
    respond_to do |wants|
      wants.html
      wants.js {render :text => @tags.map{|tag| tag.name}.join("\n")}
    end
  end
  def findcarmake
    if params[:q]
      @tags = Tag.named_like(params[:q])
    else
      @tags = Tag.all
    end
    respond_to do |wants|
      wants.html
      wants.js {render :text => @tags.map{|tag| tag.name}.join("\n")}
    end
  end
  def findregion
    if params[:q]
      @tags = Tag.named_like(params[:q])
    else
      @tags = Tag.all
    end
    respond_to do |wants|
      wants.html
      wants.js {render :text => @tags.map{|tag| tag.name}.join("\n")}
    end
  end

  private
 

  protected
  
  def preload_club
    @club = Club.find(params[:id])
  end

end
