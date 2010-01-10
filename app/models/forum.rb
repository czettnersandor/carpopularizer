class Forum < ActiveRecord::Base
  has_many :topics, :order => 'sticky desc, replied_at desc', :dependent => :destroy do
    def first
      @first_topic ||= find(:first)
    end
  end
  has_many :comments, :order => 'comments.created_at desc' do
    def last
      @last_comment ||= find(:first, :include => :user)
    end
  end

end
