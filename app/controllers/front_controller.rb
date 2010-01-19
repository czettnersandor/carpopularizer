class FrontController < ApplicationController

  def index
    @title = _("News")
    # @news = Rssnews.find :all, :order=>"created_at DESC", :limit=>5
    @news = Rssnews.paginate :page => params[:page], :per_page => 5, :order=>"created_at DESC"
    
    # @news_by_hits = Rssnews.find :all, :order=>"hits DESC", :limit=>5
    @news_by_hits = Rssnews.paginate :page => params[:page_by_hits], :per_page => 5, :order=>"hits DESC"

    respond_to do |format|
      format.html # index.html.erb
      format.js  { render :layout => false }
    end
  end

end
