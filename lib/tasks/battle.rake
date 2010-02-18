namespace :battle do
  desc "Closing and pointing battles"
  task(:renew => :environment){
    old_combats = Combat.find_all_by_status "active"
    old_combats.each do |combat|
      combat.close_combat!
    end
  }
end