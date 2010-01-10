class Comment < ActiveRecord::Base
  belongs_to :forum, :counter_cache => true
  belongs_to :user,  :counter_cache => true
  belongs_to :topic, :counter_cache => true
  
  before_create { |r| r.forum_id = r.topic.forum_id }
  after_create  { |r| Topic.update_all(['replied_at = ?, replied_by = ?, last_comment_id = ?', r.created_at, r.user_id, r.id], ['id = ?', r.topic_id]) }
  after_destroy do |r|
    t = Topic.find(r.topic_id)
    Topic.update_all(['replied_at = ?, replied_by = ?, last_comment_id = ?', t.comments.last.created_at, t.comments.last.user_id, t.comments.last.id], ['id = ?', t.id]) if t.comments.last
  end

  validates_presence_of :user_id, :body, :topic
  attr_accessible :body

end
