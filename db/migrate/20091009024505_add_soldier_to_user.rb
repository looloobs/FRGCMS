class AddSoldierToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :soldier_id, :integer
  end

  def self.down
    remove_column :users, :soldier_id
  end
end
