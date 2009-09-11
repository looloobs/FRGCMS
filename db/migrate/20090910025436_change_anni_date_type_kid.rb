class ChangeAnniDateTypeKid < ActiveRecord::Migration
  def self.up
    change_column :soldiers, :anni_date, :date
  end

  def self.down
    change_column :soldiers, :anni_date
  end
end
