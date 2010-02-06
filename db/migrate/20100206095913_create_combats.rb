class CreateCombats < ActiveRecord::Migration
  def self.up
    create_table :combats do |t|
      t.integer :challenger_id
      t.integer :invited_id
      t.string :status
      t.string :message
      t.integer :challenger_rate
      t.integer :invited_rate
      t.integer :winner_id

      t.timestamps
    end
  end

  def self.down
    drop_table :combats
  end
end
