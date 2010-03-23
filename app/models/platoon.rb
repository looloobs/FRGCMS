class Platoon < ActiveRecord::Base
  belongs_to :company
  belongs_to :battalion
  has_many :soldiers
  has_many :users
  has_many :primaries, :through => :soldiers
  has_many :additionals, :through => :soldiers
  
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
      self.name = params[:user][:name]
      self.position = params[:user][:position]
      self.battalion_id = params[:user][:battalion_id]
      self.company_id = params[:user][:company_id]
      self.platoon_id = params[:user][:platoon_id]
      save_without_session_maintenance
  end
end
