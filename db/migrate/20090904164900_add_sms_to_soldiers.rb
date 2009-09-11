class AddSmsToSoldiers < ActiveRecord::Migration
  def self.up
    remove_column :soldiers, :nokaddress, :string
    add_column :soldiers, :sms, :boolean
  end

  def self.down
    remove_column :soldiers, :lastname
  end
end
