class Account < ActiveRecord::Base
  has_many :battalions
  has_many :companies
  has_many :users
  
  accepts_nested_attributes_for :battalions, :allow_destroy => true
  accepts_nested_attributes_for :users, :allow_destroy => true
  accepts_nested_attributes_for :companies, :allow_destroy => true
  

end
