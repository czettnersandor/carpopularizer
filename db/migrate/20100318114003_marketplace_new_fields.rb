class MarketplaceNewFields < ActiveRecord::Migration
  def self.up
    add_column :adverts, :price, :integer
    add_column :adverts, :method, :string
    add_column :adverts, :condition, :string
    add_column :adverts, :transfer, :string
  end

  def self.down
    remove_column :adverts, :price
    remove_column :adverts, :method
    remove_column :adverts, :condition
    remove_column :adverts, :transfer
  end
end
