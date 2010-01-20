require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'


class Rssreader < ActiveRecord::Base
  has_many :rssnews

  def self.fetch_feed
    Rssreader.all.each { |feed|
      Rssreader.posts_for(feed.url).each { |rssfeed|
        if !Rssnews.exists?(:link => rssfeed.link)
          newpost = Rssnews.new()
          newpost.title = rssfeed.title
          newpost.link = rssfeed.link
          newpost.lang = feed.lang
          newpost.pub_date = rssfeed.pubDate.to_datetime
          newpost.description = rssfeed.description
          newpost.rssreader_id = feed.id
          newpost.save!
        end
      }
    }
  end

  def self.clear_old_news
    records=Rssnews.find(:all, :conditions=>["created_at < ? ",1.months.ago])
    records.delete(nil)
    # destroy valid records
    records.each { |record| record.destroy }
  end

  def self.posts_for(feed_url, length=10, perform_validation=false)
    posts = []
    open(feed_url) do |rss|
      posts = RSS::Parser.parse(rss, perform_validation)
    end.items
    # posts[0..length - 1] if posts.size > length
  end
end

