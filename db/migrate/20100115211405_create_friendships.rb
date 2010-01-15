class CreateFriendships < ActiveRecord::Migration
  def self.up
    create_table :friendships do |t|
      t.column :user_id, :integer, :null => false
      t.column :friend_id, :integer, :null => false
      t.column :status, :integer, :null => false, :default => 0
      t.column :created_at, :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :friendships
  end
end
