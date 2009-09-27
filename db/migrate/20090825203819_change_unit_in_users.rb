class ChangeUnitInUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :unit
    add_column :users, :unit, :integer
  end

  def self.down
    remove_column :users, :unit
  end
end
