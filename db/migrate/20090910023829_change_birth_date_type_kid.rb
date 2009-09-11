class ChangeBirthDateTypeKid < ActiveRecord::Migration
  def self.up
    change_column :kids, :birth_date, :date
  end

  def self.down
    change_column :kids, :birth_date
  end
end
