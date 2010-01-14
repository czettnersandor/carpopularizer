class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.string :short_url
      t.integer :hits
      t.text :body
      t.timestamps
    end
    add_index :pages, :short_url
  end

  def self.down
    drop_table :pages
  end
end
