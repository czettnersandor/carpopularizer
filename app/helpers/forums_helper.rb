module ForumsHelper
  def recent_topic_activity(topic)
    return false if not logged_in?
    return true if not session[:topics]
    return true if not session[:topics][topic.id]
    topic.replyed_at > session[:topics][topic.id]
  end 
end
