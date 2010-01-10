class BodyForTopic < ActiveRecord::Migration
  def self.up
    add_column :topics, :body,    :text
  end

  def self.down
    remove_column :topics, :body
  end
end
