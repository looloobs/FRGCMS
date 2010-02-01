class Battalion < ActiveRecord::Base

  has_many :users
  has_many :companies
  has_many :platoons
  has_many :soldiers
  has_many :primaries
  has_many :additionals
  belongs_to :account
  
  accepts_nested_attributes_for :companies, :allow_destroy => true
  accepts_nested_attributes_for :users, :allow_destroy => true
  
  #include Authentication
  #include Authentication::ByCookieToken
	#include Authentication::UserAbstraction
	
	#set_inheritance_column :user_type
	#validates_presence_of  :user_type
  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
	# Add identity_url if you want users to be able to update their OpenID identity
  #attr_accessible :login, :email, :name, :password, :password_confirmation, :invitation_token, :position, :battalion_id, :company_id, :soldier_id
	
  
end
