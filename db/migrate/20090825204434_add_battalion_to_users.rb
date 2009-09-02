class AddBattalionToUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :unit
    add_column :users, :battalion_id, :integer
  end

  def self.down
    remove_column :users, :battalion_id
  end
end
