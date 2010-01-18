class ImageOrdinal < ActiveRecord::Migration
  def self.up
    add_column :images, :ordinal, :integer
  end

  def self.down
    remove_column :images, :ordinal
  end
end
