class UserColumnsForDealer < ActiveRecord::Migration
  def self.up
    rename_column :users, :type, :usertype
    add_column :users, :website, :string
    add_column :users, :nyitvatartas, :text
    add_column :users, :contact_person, :text
    add_column :users, :contact_phone, :text
    add_column :users, :lat, :float
    add_column :users, :lng, :float

    add_index  :users, [:lat, :lng]
  end

  def self.down
    rename_column :users, :usertype, :rtype
    remove_column :users, :website
    remove_column :users, :nyitvatartas
    remove_column :users, :contact_person
    remove_column :users, :contact_phone
    remove_column :users, :lat
    remove_column :users, :lng

  end
end
