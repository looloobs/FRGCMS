#require 'digest/sha1'
class User < ActiveRecord::Base  
  acts_as_authentic do |c|
    c.transition_from_restful_authentication = true
    c.validates_length_of_password_field_options = {:on => :update, :minimum => 4, :if => :has_no_credentials?}
    c.validates_length_of_password_confirmation_field_options = {:on => :update, :minimum => 4, :if => :has_no_credentials?}
    c.validate_login_field = false
    c.validate_email_field = false
    
  end
  acts_as_textiled :signature
  
  belongs_to :battalion
  belongs_to :company
  belongs_to :platoon
  belongs_to :account
  has_many :soldiers
  has_many :messages
  #has_many :roles
  #has_one :position
  
  ROLES = %w[admin battalion company trnco poc]
  
  #accepts_nested_attributes_for :roles, :allow_destroy => true
  accepts_nested_attributes_for :soldiers, :allow_destroy => true
  
  def role_symbols
    [role.to_sym]
  end
  
  named_scope :battalion_commander, :conditions =>{:position => 'Battalion Commander'}
  named_scope :csm, :conditions =>{:position => 'Command Sergeant Major'}
  named_scope :frsa, :conditions =>{:position => 'FRSA'}
  named_scope :battalion_frg, :conditions =>{:position => 'Battalion FRG Leader'}
  named_scope :battalion_co_frg, :conditions =>{:position => 'Battalion FRG Co-Leader'}
  named_scope :rear_d, :conditions =>{:position => 'Rear-D Commander'}
  named_scope :s_one, :conditions =>{:position => 'S1'}
  named_scope :company_commanders, :conditions =>{:position => 'Company Commander'}
  named_scope :first_sg, :conditions =>{:position => '1st Sergeant'}
  named_scope :frg, :conditions =>{:position => 'FRG Leader'}
  named_scope :training_nco, :conditions =>{:position => 'Training Room NCO'}
  named_scope :poc, :conditions =>{:position => 'POC'}
  named_scope :other_user, :conditions =>{:position => 'Other'}
  #named_scope :active, :conditions => {:active => "1"}
  
	attr_accessible :name, :login, :email, :password, :password_confirmation, :position, :battalion_id, :company_id, :platoon_id, :role, :signature 
    def active?
      active
    end
  
    def activate!(params)
      self.active = 1
      self.login = params[:user][:login]
      self.password = params[:user][:password]
      self.password_confirmation = params[:user][:password_confirmation]
      save
    end
    
    def deliver_activation_instructions!
        reset_perishable_token!
        NotifierMailer.deliver_activation_instructions(self)
    end
    
    def deliver_activation_instructions_frsa!
        reset_perishable_token!
        NotifierMailer.deliver_activation_instructions_frsa(self)
    end
    def deliver_activation_instructions_battalion!
        reset_perishable_token!
        NotifierMailer.deliver_activation_instructions_battalion(self)
    end
    def deliver_activation_instructions_cc!
        reset_perishable_token!
        NotifierMailer.deliver_activation_instructions_cc(self)
    end
    def deliver_activation_instructions_frg_leader!
        reset_perishable_token!
        NotifierMailer.deliver_activation_instructions_frg_leader(self)
    end
    def deliver_activation_instructions_poc!
        reset_perishable_token!
        NotifierMailer.deliver_activation_instructions_poc(self)
    end
    def deliver_activation_confirmation!
        reset_perishable_token!
        NotifierMailer.deliver_activation_confirmation(self)
    end
    def deliver_password_reset_instructions!  
      reset_perishable_token!  
      Notifier.deliver_password_reset_instructions(self)  
    end
    
    def has_no_credentials?
        self.crypted_password.blank?
    end
    
    def signup!(params)
        self.email = params[:user][:email]
        self.name = params[:user][:name]
        self.position = params[:user][:position]
        self.battalion_id = params[:user][:battalion_id]
        self.company_id = params[:user][:company_id]
        self.platoon_id = params[:user][:platoon_id]
        self.role = params[:user][:role]
        save_without_session_maintenance
    end
    
    
    
end
