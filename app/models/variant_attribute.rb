class VariantAttribute < ActiveRecord::Base
  #join model
  belongs_to :product_variant
  
  
end
