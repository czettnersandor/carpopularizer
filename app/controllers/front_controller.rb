class FrontController < ApplicationController

  def index
    @title = _("News")
    @news = Rssnews.find :all, :order=>"created_at DESC", :limit=>5
    @news_by_hits = Rssnews.find :all, :order=>"hits DESC", :limit=>5
    
  end

end
