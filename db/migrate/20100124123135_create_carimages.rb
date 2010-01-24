class CreateCarimages < ActiveRecord::Migration
  def self.up
    create_table :carimages do |t|
      t.integer :car_id
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.string :title
      t.integer :ordinal

      t.timestamps
    end

    remove_column :cars, :gallery_id
    add_column :cars, :description, :text
  end

  def self.down
    drop_table :carimages
    add_columns :cars, :gallery_id, :integer
    remove_column :cars, :description
  end
end
