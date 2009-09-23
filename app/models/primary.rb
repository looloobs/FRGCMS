class Primary < ActiveRecord::Base
  belongs_to :soldier
  belongs_to :company
  belongs_to :battalion
end
