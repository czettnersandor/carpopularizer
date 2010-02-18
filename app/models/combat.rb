class Combat < ActiveRecord::Base
  belongs_to :challenger, :class_name => "Car", :foreign_key => :challenger_id
  belongs_to :invited, :class_name => "Car", :foreign_key => :invited_id
  has_many :combat_votes

  default_scope :order => 'created_at ASC'

  def vote_for(car_id, user_id)
    # TODO ellenőrizni, hogy az user nem szavazott és az autók benne vannak a párbajban
    vote = CombatVote.new({:voted_car => car_id, :user_id => user_id, :combat_id => self.id})
    vote.save

    if self.challenger_id == car_id.to_i
      self.increment!("challenger_rate")
    end

    if self.invited_id == car_id.to_i
      self.increment!("invited_rate")
    end
  end

  def close_combat!
    self.combat_votes.destroy_all
    newcup = Cup.new
    if self.challenger_rate.to_i > self.invited_rate.to_i
      self.challenger.increment!("combat_win")
      self.invited.increment!("combat_lost")
      self.winner_id = self.challenger_id
      newcup.car_id = self.challenger_id
      newcup.opponent_car_id = self.invited_id
      newcup.description = "wins a combat against"
      newcup.user_id = self.challenger.user_id
      newcup.style = "medium"
    else
      self.invited.increment!("combat_win")
      self.challenger.increment!("combat_lost")
      self.winner_id = self.invited_id
      newcup.car_id = self.invited_id
      newcup.opponent_car_id = self.challenger_id
      newcup.description = "wins a combat against"
      newcup.user_id = self.invited.user_id
      newcup.style = "medium"
    end
    self.status = "done"
    self.save
    newcup.save
  end

end
