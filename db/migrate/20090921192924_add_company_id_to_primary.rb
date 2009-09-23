class AddCompanyIdToPrimary < ActiveRecord::Migration
  def self.up
    add_column :primaries, :battalion_id, :integer
    add_column :primaries, :company_id, :integer
    add_column :additionals, :battalion_id, :integer
    add_column :additionals, :company_id, :integer
  end

  def self.down
    remove_column :primaries, :battalion_id
    remove_column :primaries, :company_id
    remove_column :additionals, :battalion_id
    remove_column :additionals, :company_id
  end
end
