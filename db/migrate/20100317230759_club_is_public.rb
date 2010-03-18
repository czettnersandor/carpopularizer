class ClubIsPublic < ActiveRecord::Migration
  def self.up
    add_column :clubs, :public, :boolean
  end

  def self.down
    remove_column :clubs, :public
  end
end
