class FriendshipObserver < ActiveRecord::Observer
  def after_update(friendship)
    if friendship.accepted?
      @uevent = Userevent.new(
        :user => friendship.user,
        :message => _("has new friend:")+
          ' <a href="/users/'+friendship.friend_id.to_s+'">'+friendship.friend.login+'</a>')
      @uevent.save!
    end
  end
end
