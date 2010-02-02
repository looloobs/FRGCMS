#require 'digest/sha1'
class User < ActiveRecord::Base  
  acts_as_authentic do |c|
    c.transition_from_restful_authentication = true
    c.validates_length_of_password_field_options = {:on => :update, :minimum => 4, :if => :has_no_credentials?}
    c.validates_length_of_password_confirmation_field_options = {:on => :update, :minimum => 4, :if => :has_no_credentials?}
    c.validate_login_field = false
    c.validate_email_field = false
    
  end
  
  belongs_to :battalion
  belongs_to :company
  belongs_to :account
  has_many :soldiers
  has_many :messages
  
	attr_accessible :login, :email, :password, :password_confirmation

    def active?
      active
    end
  
    def activate!(params)
      self.active = 1
      self.password = params[:user][:password]
      self.password_confirmation = params[:user][:password_confirmation]
      save
    end
    
    def deliver_activation_instructions!
        reset_perishable_token!
        NotifierMailer.deliver_activation_instructions(self)
    end

    def deliver_activation_confirmation!
        reset_perishable_token!
        NotifierMailer.deliver_activation_confirmation(self)
    end
    
    def has_no_credentials?
        self.crypted_password.blank?
    end
    
    def signup!(params)
        self.login = params[:user][:login]
        self.email = params[:user][:email]
        save_without_session_maintenance
    end

    
    
    
    
end
