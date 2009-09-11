class Soldier < ActiveRecord::Base
  belongs_to :company
  belongs_to :battalion
  has_many :primaries
  has_many :additionals
  has_many :kids
  has_many :users
  accepts_nested_attributes_for :primaries, :kids, :additionals
  

  
  
end
