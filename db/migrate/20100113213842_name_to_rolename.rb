class NameToRolename < ActiveRecord::Migration
  def self.up
    rename_column(:roles, :name, :rolename)
  end

  def self.down
    rename_column(:roles, :rolename, :name)
  end
end
