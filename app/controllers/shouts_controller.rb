class ShoutsController < ApplicationController

  def create
    @shout = Shout.new(params[:shout])
    @club = Club.find(params[:club_id])
    @shout.club = @club
    @shout.user_id = params[:user_id]
    respond_to do |format|
      if @shout.save
        format.html { redirect_to(@club) }
        format.xml  { render :xml => @shout, :status => :created, :location => @shout }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shout.errors, :status => :unprocessable_entity }
      end
    end

  end

end
