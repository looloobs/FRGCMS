class Primary < ActiveRecord::Base
  belongs_to :soldier
  belongs_to :company
  belongs_to :battalion
  belongs_to :user
validates_presence_of :relationship  
validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "NOK E-Mail Invalid", :allow_blank => true 
end
