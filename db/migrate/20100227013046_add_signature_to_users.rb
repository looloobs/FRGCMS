class AddSignatureToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :signature, :text
  end

  def self.down
    remove_column :users, :signature
  end
end