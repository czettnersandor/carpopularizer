class CombatsController < ApplicationController

  before_filter :login_required

  def index
    @title = _("Combat vote")
    @last = Combat.find(:last,
      :conditions => ["id IN (SELECT combat_id FROM combat_votes WHERE user_id = ?)", current_user.id])
    @combat = Combat.find(:first,
      :conditions => ["id NOT IN (SELECT combat_id FROM combat_votes WHERE user_id = ?)", current_user.id])
  end

  def new
    @title = _("Invite to a combat")
    @car = Car.find(params[:box_id])
    @user = @car.user
    @mycars = load_my_cars
    @combat = Combat.new
  end

  def create
    @car = Car.find(params[:box_id])
    @invitercar = Car.find(params[:combat][:challenger_id])
    @user = @car.user
    @combat = Combat.new(params[:combat])
    @combat.invited_id = @car.id
    @combat.status = "pending"
    respond_to do |format|
      if @invitercar.invitable? && @combat.save
        
        flash[:notice] = _('Your invitation has done.')
        format.html { redirect_to(current_user) }
        format.xml  { render :xml => @combat, :status => :created, :location => @combat }
      else
        format.html {
          if not @invitercar.invitable?
            flash[:notice] = _('Your selected car is already in a combat.')
            @mycars = load_my_cars
          end
          render :action => "new"
        }
        format.xml  { render :xml => @combat.errors, :status => :unprocessable_entity }
      end
    end
  end

  def vote
    @combat = Combat.find params[:id]
    @combat.vote_for(params[:car], current_user.id)
    redirect_to combats_path
  end

  protected
  def load_my_cars
    mycars = Hash.new
    current_user.cars.each do |car|
      mycars[car.name] = car.id
    end
    return mycars
  end

end
