class AddAddressLineToSoldiers < ActiveRecord::Migration
  def self.up
    add_column :soldiers, :address2, :string
  end

  def self.down
    remove_column :soldiers, :address2
  end
end
