class AccelerationUnit2 < ActiveRecord::Migration
  def self.up
    add_column :cars, :acceleration_unit, :string
  end

  def self.down
    remove_column :cars, :acceleration_unit
  end
end
