class FrontsController < ApplicationController

  def index
    @title = _("News")
    # @news = Rssnews.find :all, :order=>"created_at DESC", :limit=>5
    @news_hu = Rssnews.paginate :page => params[:page], :per_page => 5, :conditions => ["lang = ?", "hu"]
    @news_en = Rssnews.paginate :page => params[:page], :per_page => 5, :conditions => ["lang = ?", "en"]
    
    # @news_by_hits = Rssnews.find :all, :order=>"hits DESC", :limit=>5
    @news_by_hits_monthly = Rssnews.paginate :page => params[:page_by_hits], :per_page => 5,
      :order=>"hits DESC", :conditions => ["lang = ?", "hu"]
    @news_by_hits_weekly = Rssnews.paginate :page => params[:page_by_hits], :per_page => 5,
      :order=>"hits DESC", :conditions => ["lang = ? AND pub_date > ?", "hu", Time.now-7.days]
    @news_by_hits_daily = Rssnews.paginate :page => params[:page_by_hits], :per_page => 5,
      :order=>"hits DESC", :conditions => ["lang = ? AND pub_date > ?", "hu", Time.now-24.hours]

    @news_by_hits_en_monthly = Rssnews.paginate :page => params[:page_by_hits], :per_page => 5,
      :order=>"hits DESC", :conditions => ["lang = ?", "en"]
    @news_by_hits_en_weekly = Rssnews.paginate :page => params[:page_by_hits], :per_page => 5,
      :order=>"hits DESC", :conditions => ["lang = ? AND pub_date > ?", "en", Time.now-7.days]
    @news_by_hits_en_daily = Rssnews.paginate :page => params[:page_by_hits], :per_page => 5,
      :order=>"hits DESC", :conditions => ["lang = ? AND pub_date > ?", "en", Time.now-24.hours]

    @rssreaders_hu = Rssreader.find_all_by_lang 'hu'
    @rssreaders_en = Rssreader.find_all_by_lang 'en'

    respond_to do |format|
      format.html # index.html.erb
      format.js  { render :layout => false }
    end
    
  end

  def monthly_en
    @news = Rssnews.paginate :page => params[:page], :per_page => 5,
      :order=>"hits DESC", :conditions => ["lang = ?", "en"]
    respond_to do |format|
      format.html # index.html.erb
      format.js  { render :layout => false, :action => :ajaxnews }
    end
  end

  def daily_en
    @news = Rssnews.paginate :page => params[:page], :per_page => 5,
      :order=>"hits DESC", :conditions => ["lang = ? AND pub_date > ?", "en", Time.now-24.hours]
    respond_to do |format|
      format.html # index.html.erb
      format.js  { render :layout => false, :action => :ajaxnews }
    end
  end

  def weekly_en
    @news = Rssnews.paginate :page => params[:page], :per_page => 5,
      :order=>"hits DESC", :conditions => ["lang = ? AND pub_date > ?", "en", Time.now-24.hours]
    respond_to do |format|
      format.html # index.html.erb
      format.js  { render :layout => false, :action => :ajaxnews }
    end
  end

end
