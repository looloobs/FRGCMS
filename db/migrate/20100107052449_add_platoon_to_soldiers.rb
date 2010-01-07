class AddPlatoonToSoldiers < ActiveRecord::Migration
  def self.up
    add_column :soldiers, :platoon_id, :integer
  end

  def self.down
    remove_column :soldiers, :platoon_id
  end
end
