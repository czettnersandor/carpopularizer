class MissingEquipmentDatas < ActiveRecord::Migration
  def self.up
    add_column :equipment, :csomaghalo, :boolean
  end

  def self.down
    remove_column :equipment, :csomaghalo
  end
end
