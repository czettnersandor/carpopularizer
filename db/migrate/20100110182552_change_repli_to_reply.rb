class ChangeRepliToReply < ActiveRecord::Migration
  def self.up
    rename_column :topics, :replied_at, :replyed_at
  end

  def self.down
    rename_column :topics, :replyed_at, :replied_at
  end
end
