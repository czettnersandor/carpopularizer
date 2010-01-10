class CommentCounters < ActiveRecord::Migration
  def self.up
    add_column :forums, :comments_count,    :integer
    rename_column :topics, :comment_count, :comments_count
  end

  def self.down
    remove_column :forums, :comments_count
    rename_column :topics, :comments_count, :comment_count
  end
end
