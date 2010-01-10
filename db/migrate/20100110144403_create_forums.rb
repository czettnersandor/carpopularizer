class CreateForums < ActiveRecord::Migration
  def self.up
    create_table :forums do |t|
      t.string :name
      t.string :description
      t.integer :last_topic_id
      t.integer :forum_id # Parent forum

      t.timestamps
    end
  end

  def self.down
    drop_table :forums
  end
end
