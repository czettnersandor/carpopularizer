class CreateUserevents < ActiveRecord::Migration
  def self.up
    create_table :userevents do |t|
      t.integer :user_id
      t.string :message
      t.integer :reply_id

      t.timestamps
    end
  end

  def self.down
    drop_table :userevents
  end
end
