class Rssnews < ActiveRecord::Base
  belongs_to :rssreader
  default_scope :order => 'pub_date DESC'
  def hit!
    self.class.increment_counter :hits, id
  end
end
