# Email settings
#require 'smtp_tls'

ActionMailer::Base.smtp_settings = {
  :address => "mail.blueboxgid.com ",
  :port => 2500,
  :authentication => :login,
  :user_name => "admin@frgcms.com",
  :password => "laurenrothlisberger"
  }


