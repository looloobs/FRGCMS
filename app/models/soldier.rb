class Soldier < ActiveRecord::Base
  belongs_to :company
  belongs_to :battalion
  has_many :primaries, :dependent => :destroy
  has_many :additionals, :dependent => :destroy
  has_many :kids, :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :primaries, :allow_destroy => true
  accepts_nested_attributes_for :kids, :allow_destroy => true 
  accepts_nested_attributes_for :additionals, :allow_destroy => true
  
  validates_presence_of :rank,:firstname, :lastname, :maritalstatus, :birth_date, :address,:city,:state, :zip, :email, :cellphone, 
  :on => :create, :on => :create, :message => "can't be blank"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i


  def sms_message(value)
      if value == True
        'Yes'
      else value == False
        'No'
      end
  end
  
  def self.search(search)
    if search
      find(:all, :conditions => ['lastname LIKE ?', "%#{search}%"], :order => 'lastname')
    else
      find(:all, :order => 'lastname')
    end
  end


end
