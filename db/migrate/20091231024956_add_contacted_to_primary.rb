class AddContactedToPrimary < ActiveRecord::Migration
  def self.up
    add_column :primaries, :contacted, :string
  end

  def self.down
    remove_column :primaries, :contacted
  end
end
