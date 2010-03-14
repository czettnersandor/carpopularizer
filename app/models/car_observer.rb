class CarObserver < ActiveRecord::Observer
  def after_create(car)
    @uevent = Userevent.new(
      :user => car.user,
      :message => _("Has submitted a new car")+
        ' <a href="/users/'+car.user_id.to_s+'/box/'+car.id.to_s+'">'+car.name+'</a>')
    @uevent.save!
  end

  def after_update(car)
    @uevent = Userevent.new(
      :user => car.user,
      :message => _("Has updated:")+
        ' <a href="/users/'+car.user_id.to_s+'/box/'+car.id.to_s+'">'+car.name+'</a>')
    @uevent.save!
  end
end
