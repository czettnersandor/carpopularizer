class FrontController < ApplicationController

  def index
    @title = _("News")
    # @news = Rssnews.find :all, :order=>"created_at DESC", :limit=>5
    @news_hu = Rssnews.paginate :page => params[:page], :per_page => 5, :conditions => ["lang = ?", "hu"]
    @news_en = Rssnews.paginate :page => params[:page], :per_page => 5, :conditions => ["lang = ?", "en"]
    
    # @news_by_hits = Rssnews.find :all, :order=>"hits DESC", :limit=>5
    @news_by_hits_monthly = Rssnews.paginate :page => params[:page_by_hits], :per_page => 5,
      :order=>"hits DESC"
    @news_by_hits_daily = Rssnews.paginate :page => params[:page_by_hits], :per_page => 5,
      :order=>"hits DESC", :conditions => ["pub_date > ?", Time.now-24.hours]

    respond_to do |format|
      format.html # index.html.erb
      format.js  { render :layout => false }
    end
    
  end

end
