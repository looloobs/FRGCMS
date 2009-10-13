class Soldier < ActiveRecord::Base
  belongs_to :company
  belongs_to :battalion
  has_many :primaries
  has_many :additionals
  has_many :kids
  belongs_to :user
  accepts_nested_attributes_for :primaries, :kids, :additionals
  validates_presence_of :rank,:firstname, :lastname, :maritalstatus, :birth_date, :address,:city,:state, :zip, :email, :cellphone, 
  :on => :create, :on => :update, :message => "can't be blank" 
end
