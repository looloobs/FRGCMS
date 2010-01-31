class AddAccountToBattalion < ActiveRecord::Migration
  def self.up
    add_column :battalions, :account_id, :integer
  end

  def self.down
    remove_column :battalions, :account_id
  end
end
