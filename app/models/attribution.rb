class Attribution < ActiveRecord::Base
  
  belongs_to :product_variant
  belongs_to :attribute
  
end
