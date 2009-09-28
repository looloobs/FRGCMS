class AddSmsToSoldiers < ActiveRecord::Migration
  def self.up
    
  end

  def self.down
    add_column :soldiers, :nokaddress
  end
end
