class CreateRssnews < ActiveRecord::Migration
  def self.up
    create_table :rssnews do |t|
      t.string :title
      t.string :link
      t.datetime :pub_date
      t.text :description
      t.timestamps
    end
    add_index :rssnews, :pub_date
  end

  def self.down
    drop_table :rssnews
  end
end
