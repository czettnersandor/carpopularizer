class CreateCars < ActiveRecord::Migration
  def self.up
    create_table :cars do |t|
      t.integer :genre
      t.string :name
      t.integer :user_id
      t.integer :gallery_id
      t.integer :make         # Kivitel
      t.string :age_grade     # Évjárat
      t.string :ccm
      t.string :performance
      t.integer :fuel
      t.float :acceleration
      t.integer :topspeed
      t.float :torque
      t.string :color
      t.integer :ordinal

      t.timestamps
    end

    add_column :users, :maximum_cars, :integer
    add_index :cars, :user_id
  end

  def self.down
    drop_table :cars
    remove_column :users, :maximum_cars
  end
end
