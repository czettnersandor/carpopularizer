class Autocondition < ActiveRecord::Migration
  def self.up
    add_column :cars, :condition, :integer
  end

  def self.down
    remove_column :cars, :condition
  end
end
