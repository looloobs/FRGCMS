class AddPositionToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :position, :string
    add_column :users, :unit, :string
  end

  def self.down
    remove_column :users, :position
    remove_column :users, :unit
  end
end
