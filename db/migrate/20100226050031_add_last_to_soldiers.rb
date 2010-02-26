class AddLastToSoldiers < ActiveRecord::Migration
  def self.up
    add_column :soldiers, :four, :string
  end

  def self.down
    remove_column :soldiers, :four
  end
end
