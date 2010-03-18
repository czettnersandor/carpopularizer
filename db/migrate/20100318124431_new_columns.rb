class NewColumns < ActiveRecord::Migration
  def self.up
    add_column :cars, :price_unit, :string
    add_column :cars, :performance_unit, :string
    add_column :cars, :month, :integer
    remove_column :cars, :engine
    remove_column :cars, :audio
  end

  def self.down
   remove_column :cars, :price_unit
   remove_column :cars, :month
   remove_column :cars, :performance_unit
   add_column :cars, :engine, :text
   add_column :cars, :audio, :text
  end
end
