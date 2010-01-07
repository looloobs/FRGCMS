class Company < ActiveRecord::Base
  has_many :users
  has_many :soldiers
  has_many :primaries
  has_many :additionals
  has_many :kids
  has_many :platoons
  belongs_to :battalion 
 
  def self.search(search)
    if search
      find(:all, :conditions => ['lastname LIKE ?', "%#{search}%"], :order => 'lastname')
    else
      find(:all, :order => 'lastname')
    end
  end

end
