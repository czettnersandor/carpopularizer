class CreateClubs < ActiveRecord::Migration
  def self.up
    create_table :clubs do |t|
      t.string :name
      t.string :short_description
      t.string :description
      t.string :type
      t.integer :owner_id
      t.string :logo_file_name
      t.string :logo_content_type
      t.datetime :logo_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :clubs
  end
end
