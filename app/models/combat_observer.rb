class CombatObserver < ActiveRecord::Observer
  def after_create(combat)
    UserMailer.deliver_combat_notify(combat)
    @uevent = Userevent.new(
      :user => combat.invited.user,
      :message => _("Has challenged to a new combat tomorrow")
    )
    @uevent.save!
    @uevent = Userevent.new(
      :user => combat.challenger.user,
      :message => "Has invited "+combat.invited.user.login+" to a combat"
    )
    @uevent.save!
  end
end
