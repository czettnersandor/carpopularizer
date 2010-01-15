class FriendshipStatus < ActiveRecord::Migration
  def self.up
    change_column :friendships, :status, :string
  end

  def self.down
    change_column :friendships, :status, :integer
  end
end
