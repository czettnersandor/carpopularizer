class Permalink < ActiveRecord::Migration
  def self.up
    rename_column(:pages, :short_url, :permalink)
  end

  def self.down
    rename_column(:pages, :permalink, :short_url)
  end
end
