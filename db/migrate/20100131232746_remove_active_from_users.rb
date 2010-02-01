class RemoveActiveFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :active, :string
  end

  def self.down
    add_column :users, :active
  end
end
