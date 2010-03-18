class Autoadatok < ActiveRecord::Migration
  def self.up
    add_column :cars, :price, :integer
    add_column :cars, :km, :integer
    add_column :cars, :km_unit, :string
  end

  def self.down
    remove_column :cars, :price, :integer
    remove_column :cars, :km, :integer
    remove_column :cars, :km_unit, :string
  end
end
