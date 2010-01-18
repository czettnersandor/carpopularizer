class GalleryTitle < ActiveRecord::Migration
  def self.up
    add_column :galleries, :title, :string
    add_column :images, :title, :string
  end

  def self.down
    remove_column :galleries, :title
    remove_column :images, :title
  end
end
