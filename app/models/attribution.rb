class Attribution < ActiveRecord::Base
  
  belongs_to :variant
  belongs_to :trait
  
end
