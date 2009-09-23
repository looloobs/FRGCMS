class Company < ActiveRecord::Base
  has_many :users
  has_many :soldiers
  has_many :primaries
  has_many :additionals
  belongs_to :battalion 
 

end
