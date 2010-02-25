class Message < ActiveRecord::Base
  acts_as_textiled 
  
  belongs_to :users
  #validates_presence_of :bcc_email, :if => :cc_mail?
  
  has_attached_file :attachment      
  
  def soldier_name=(lastname)
    self.soldier = Soldier.find_by_name(lastname)
  end
               

end
