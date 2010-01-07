class Battalion < ActiveRecord::Base
  has_many :users
  has_many :companies
  has_many :platoons
  has_many :soldiers
  has_many :primaries
  has_many :additionals
  
end
