class CreateShouts < ActiveRecord::Migration
  def self.up
    create_table :shouts do |t|
      t.integer :user_id
      t.integer :club_id
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :shouts
  end
end
