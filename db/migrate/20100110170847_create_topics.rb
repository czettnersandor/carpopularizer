class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.integer :forum_id
      t.integer :user_id
      t.string :title
      t.integer :hits
      t.integer :sticky
      t.integer :comment_count
      t.boolean :locked
      t.datetime :replied_at
      t.integer :replyed_by
      t.integer :last_comment_id

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
