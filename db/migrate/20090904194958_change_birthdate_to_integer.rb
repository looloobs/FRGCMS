class ChangeBirthdateToInteger < ActiveRecord::Migration
  def self.up
    change_column :soldiers, :birth_date, :integer
    change_column :soldiers, :anni_date, :integer
  end

  def self.down
    change_column :soldier, :birth_date
  end
end
