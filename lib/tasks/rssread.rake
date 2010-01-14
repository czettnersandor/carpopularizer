namespace :rssread do
  desc "Just what Date is it really"
  task(:read => :environment){
    p Rssreader.fetch_feed
  }
  task(:clear => :environment){
    p Rssreader.clear_old_news
  }
end