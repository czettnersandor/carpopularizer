class CarsModelFix < ActiveRecord::Migration
  def self.up
    change_column :cars, :genre, :string
    change_column :cars, :make, :string
  end

  def self.down
    change_column :cars, :genre, :integer
    change_column :cars, :make, :integer
  end
end
