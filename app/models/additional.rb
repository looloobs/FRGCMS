class Additional < ActiveRecord::Base
  belongs_to :soldier
  belongs_to :company
  belongs_to :battalion
  belongs_to :user
end
