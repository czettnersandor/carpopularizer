class CreateMeetings < ActiveRecord::Migration
  def self.up
    create_table :meetings do |t|
      t.string :title
      t.text :description
      t.datetime :startdate
      t.string :country
      t.string :city
      t.string :address

      t.timestamps
    end
  end

  def self.down
    drop_table :meetings
  end
end
