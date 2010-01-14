class RssHitAndRelations < ActiveRecord::Migration
  def self.up
    add_column :rssnews, :rssreader_id, :integer
    add_column :rssnews, :hits, :integer
  end

  def self.down
    remove_column :rssnews, rssreader_id
    remove_column :rssnews, :hits
  end
end
