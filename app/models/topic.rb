class Topic < ActiveRecord::Base
  belongs_to :forum, :counter_cache => true
  belongs_to :user
  has_many :comments, :order => 'comments.created_at', :dependent => :destroy do
    def last
      @last_post ||= find(:first, :order => 'comments.created_at desc')
    end
  end
  def hit!
    self.class.increment_counter :hits, id
  end

  def sticky?() sticky == 1 end

  def views() hits end

end
