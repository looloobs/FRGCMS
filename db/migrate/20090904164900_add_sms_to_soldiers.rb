class AddSmsToSoldiers < ActiveRecord::Migration
  def self.up
    remove_column :soldiers, :nokaddress
     add_column :soldiers, :nokaddress, :string
  end

  def self.down
    add_column :soldiers, :nokaddress
  end
end
