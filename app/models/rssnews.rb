class Rssnews < ActiveRecord::Base
  belongs_to :rssreader
  def hit!
    self.class.increment_counter :hits, id
  end
end
