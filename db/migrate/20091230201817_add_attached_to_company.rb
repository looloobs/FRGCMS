class AddAttachedToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :attached_id, :integer
  end

  def self.down
    remove_column :companies, :attached_id
  end
end
