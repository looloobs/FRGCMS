class AddYetAnotherAdmin < ActiveRecord::Migration
  def self.up
    #Be sure to change these settings for your initial admin user
    user = SiteUser.new
		user.login = "plka"
		user.email = APP_CONFIG['settings']['admin_email']
		user.password = "lufury2"
		user.password_confirmation = "lufury2"
		user.position = "FRSA"
		user.battalion_id = "1"
    user.save(false)
		role = Role.new
		#Admin role name should be "admin" for convenience
		role.name = "admin"
		role.save
		admin_user = SiteUser.find_by_login("frgcms")
		admin_role = Role.find_by_name("admin")
		admin_user.activated_at = Time.now.utc
		admin_user.roles << admin_role
		admin_user.save(false)
  end

  def self.down
  end
end
