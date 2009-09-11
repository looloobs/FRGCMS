class ChangeSoldiersTableBirthdate < ActiveRecord::Migration
  def self.up
    change_column :soldiers, :birth_date, :date
  end

  def self.down
  end
end
