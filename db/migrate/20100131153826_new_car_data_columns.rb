class NewCarDataColumns < ActiveRecord::Migration
  def self.up
    add_column :cars, :interior, :text
    add_column :cars, :exterior, :text
    add_column :cars, :engine, :text
    add_column :cars, :audio, :text
    add_column :meetings, :club_id, :integer
  end

  def self.down
    remove_column :cars, :interior
    remove_column :cars, :exterior
    remove_column :cars, :engine
    remove_column :cars, :audio
    remove_column :meetings, :club_id
  end
end
