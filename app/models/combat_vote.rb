class CombatVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :combat
  belongs_to :car
end
