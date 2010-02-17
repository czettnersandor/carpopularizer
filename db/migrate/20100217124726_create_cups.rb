class CreateCups < ActiveRecord::Migration
  def self.up
    create_table :cups do |t|
      t.integer :user_id
      t.integer :car_id
      t.string :style
      t.string :description
      t.integer :opponent_car_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cups
  end
end
