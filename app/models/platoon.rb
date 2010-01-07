class Platoon < ActiveRecord::Base
  belongs_to :company
  belongs_to :battalion
  has_many :soldiers
end
