class CreateAdverts < ActiveRecord::Migration
  def self.up
    create_table :adverts do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.datetime :end_at

      t.timestamps
    end

    add_column :carimages, :advert_id, :integer
  end

  def self.down
    drop_table :adverts
    remove_column :carimages, :advert_id
  end
end
