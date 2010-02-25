class AddPlatoonsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :platoon_id, :integer
  end

  def self.down
    remove_column :users, :platoon_id
  end
end
