class RolesUsers < ActiveRecord::Migration
  def self.up
    create_table :roles_users, :id => false do |t|
      t.column :user_id,     :integer
      t.column :role_id,   :integer
    end
    add_index :roles_users, [:user_id, :role_id]
  end

  def self.down
    drop_table :roles_users
  end
end
