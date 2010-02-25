class Company < ActiveRecord::Base
  has_many :users
  has_many :soldiers
  has_many :primaries
  has_many :additionals
  has_many :kids
  has_many :platoons
  belongs_to :battalion 
  belongs_to :account



end
