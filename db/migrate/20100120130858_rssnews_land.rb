class RssnewsLand < ActiveRecord::Migration
  def self.up
    add_column :rssnews, :lang, :string
    add_column :rssreaders, :lang, :string
  end

  def self.down
    remove_column :rssnews, :lang
    remove_column :rssreaders, :lang
  end
end
