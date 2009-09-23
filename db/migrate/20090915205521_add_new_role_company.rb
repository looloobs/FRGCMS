class AddNewRoleCompany < ActiveRecord::Migration
  def self.up
    role = Role.new
    #Admin role name should be "admin" for convenience
    role.name = "company"
    role.save
  end

  def self.down
  end
end
