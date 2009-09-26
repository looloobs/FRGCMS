class Soldier < ActiveRecord::Base
  belongs_to :company
  belongs_to :battalion
  has_many :primaries
  has_many :additionals
  has_many :kids
  has_many :users
  accepts_nested_attributes_for :primaries, :kids, :additionals
  validates_presence_of :rank,:firstname, :lastname, :maritalstatus, :birth_date, :address,:city,:state, :zip, :email, :cell, 
  :on => :create, :on => :update, :message => "can't be blank"
  

  
  
end