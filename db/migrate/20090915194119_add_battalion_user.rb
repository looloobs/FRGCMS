class AddBattalionUser < ActiveRecord::Migration
  def self.up
      #Be sure to change these settings for your initial admin user
        role = Role.new
        #Admin role name should be "admin" for convenience
        role.name = "battalion"
        role.save


  end

  def self.down
   

  end
end
