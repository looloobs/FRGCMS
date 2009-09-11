class ChangeBirthDateTypePrimary < ActiveRecord::Migration
  def self.up
    change_column :primaries, :birth_date, :date
  end

  def self.down
    change_column :primaries, :birth_date
  end
end
