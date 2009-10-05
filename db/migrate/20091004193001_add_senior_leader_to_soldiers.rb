class AddSeniorLeaderToSoldiers < ActiveRecord::Migration
  def self.up
    add_column :soldiers, :seniorleader, :string
    add_column :soldiers, :pregnant, :string
    add_column :soldiers, :duedate, :date
  end

  def self.down
    remove_column :soldiers, :duedate
    remove_column :soldiers, :pregnant
    remove_column :soldiers, :seniorlead
  end
end
