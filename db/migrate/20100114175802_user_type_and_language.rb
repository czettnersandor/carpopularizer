class UserTypeAndLanguage < ActiveRecord::Migration
  def self.up
    add_column :users, :type, :integer
    add_column :users, :lang, :string
    add_index :users, :type
  end

  def self.down
    remove_column :users, :type
    remove_column :users, :lang
  end
end
