class CreateCarcomments < ActiveRecord::Migration
  def self.up
    create_table :carcomments do |t|
      t.integer :user_id
      t.integer :car_id
      t.text :body
      t.integer :reply_to

      t.timestamps
    end
  end

  def self.down
    drop_table :carcomments
  end
end
