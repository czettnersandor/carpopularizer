class Usercolumns < ActiveRecord::Migration
  def self.up
    add_column :users, :activation_code, :string, :limit => 40
    add_column :users, :activated_at, :datetime
    add_column :users, :password_reset_code, :string, :limit => 40
    add_column :users, :enabled, :boolean, :default => true
    add_column :users, :nem, :integer
    add_column :users, :country, :string, :limit => 80
    add_column :users, :city, :string, :limit => 80

    add_column :users, :name, :string, :limit => 255
    add_column :users, :birth, :datetime
    add_column :users, :zip, :string, :limit => 16
    add_column :users, :address, :string, :limit => 255
    add_column :users, :phone, :string, :limit => 128
    add_column :users, :langs, :string, :limit => 255
    add_column :users, :about, :string, :limit => 255
    add_column :users, :profileimage, :string, :limit => 255
  end

  def self.down
    remove_column :users, :actiation_code
    remove_column :users, :activated_at
    remove_column :users, :password_reset_code
    remove_column :users, :enabled
    remove_column :users, :nem
    remove_column :users, :country
    remove_column :users, :city

    remove_column :users, :name
    remove_column :users, :birth
    remove_column :users, :zip
    remove_column :users, :address
    remove_column :users, :phone
    remove_column :users, :langs
    remove_column :users, :about
    remove_column :users, :profileimage
  end
end
