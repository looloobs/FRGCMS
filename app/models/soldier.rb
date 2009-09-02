class Soldier < ActiveRecord::Base
  belongs_to :company
  belongs_to :battalion
end
