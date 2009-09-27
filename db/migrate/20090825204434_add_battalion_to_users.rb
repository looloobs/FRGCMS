class AddBattalionToUsers < ActiveRecord::Migration
  def self.up

    add_column :users, :battalion_id, :integer
  end

  def self.down
    remove_column :users, :battalion_id
  end
end
