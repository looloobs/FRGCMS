class Message < ActiveRecord::Base
  belongs_to :users
  #validates_presence_of :bcc_email, :on => :create, :message => "can't be blank"

end
