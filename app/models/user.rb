#require 'digest/sha1'
class User < ActiveRecord::Base  
  acts_as_authentic do |c|
    c.transition_from_restful_authentication = true
  end
  
  belongs_to :battalion
  belongs_to :company
  has_many :soldiers
  has_many :messages
  
	
end
