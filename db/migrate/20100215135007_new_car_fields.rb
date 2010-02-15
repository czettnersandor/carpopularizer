class NewCarFields < ActiveRecord::Migration
  def self.up
    add_column :cars, :for_sale, :boolean
    add_column :cars, :tournament_win, :integer
    add_column :cars, :tournament_lost, :integer
    add_column :cars, :combat_win, :integer
    add_column :cars, :combat_lost, :integer
  end

  def self.down
    remove_column :cars, :for_sale
    remove_column :cars, :tournament_win
    remove_column :cars, :tournament_lost
    remove_column :cars, :combat_win
    remove_column :cars, :combat_lost
  end
end
