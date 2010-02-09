class CreateCombatVotes < ActiveRecord::Migration
  def self.up
    create_table :combat_votes do |t|
      t.integer :user_id
      t.integer :combat_id
      t.integer :voted_car

      t.timestamps
    end
  end

  def self.down
    drop_table :combat_votes
  end
end
