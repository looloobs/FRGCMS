# Email settings
#require 'smtp_tls'

ActionMailer::Base.smtp_settings = {
  :address => "mail-gw.frgcms.com",
  :port => 2500,
  :authentication => :login,
  :user_name => "admin@frgcms.com",
  :password => "laurenrothlisberger"
  }


