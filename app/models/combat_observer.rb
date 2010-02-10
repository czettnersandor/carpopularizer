class CombatObserver < ActiveRecord::Observer
  def after_create(combat)
    UserMailer.deliver_combat_notify(combat)
  end
end
