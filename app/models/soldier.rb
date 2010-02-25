class Soldier < ActiveRecord::Base
  belongs_to :company
  belongs_to :battalion
  belongs_to :platoon
  has_many :primaries, :dependent => :destroy
  has_many :additionals, :dependent => :destroy
  has_many :kids, :dependent => :destroy
  belongs_to :user
  belongs_to :message
  
  accepts_nested_attributes_for :primaries, :allow_destroy => true
  accepts_nested_attributes_for :kids, :allow_destroy => true 
  accepts_nested_attributes_for :additionals, :allow_destroy => true
  
  validates_presence_of :rank,:firstname, :lastname, :maritalstatus, :birth_date, :address,:city,:state, :zip, :email, :cellphone, 
  :on => :create, :on => :create, :message => "can't be blank"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i


  def sms_message(value)
      if value == true
        'Yes'
      else value == nil
        'No'
      end
  end
  
  def self.search(search)
    if search
      find(:all, :joins => [:primaries, :additionals], :conditions => ['soldiers.email LIKE ? OR primaries.email LIKE ? OR soldiers.firstname LIKE? OR primaries.firstname LIKE? OR soldiers.lastname LIKE? OR primaries.lastname LIKE? OR additionals.email LIKE?', "%#{[search]}%", "%#{[search]}%", "%#{[search]}%", "%#{[search]}%", "%#{[search]}%", "%#{[search]}%", "%#{[search]}%"], :order => 'soldiers.lastname')
    else
      find(:all, :order => 'lastname')
    end
  end



end
