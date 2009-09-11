class Company < ActiveRecord::Base
  has_many :users
  has_many :soldiers
  belongs_to :battalion 
 
end
