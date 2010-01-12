class CommentReplyTo < ActiveRecord::Migration
  def self.up
    add_column :comments, :reply_to, :integer
  end

  def self.down
    remove_column :comments, :reply_to
  end
end
