class AddCompanyToKid < ActiveRecord::Migration
  def self.up
    add_column :kids, :company_id, :integer
  end

  def self.down
    remove_column :kids, :company_id
  end
end
