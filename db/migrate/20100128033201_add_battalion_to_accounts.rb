class AddBattalionToAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :battalion_id, :integer
  end

  def self.down
    remove_column :accounts, :battalion_id
  end
end
