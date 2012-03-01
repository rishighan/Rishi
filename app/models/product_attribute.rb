class ProductAttribute < ActiveRecord::Base
  
  # not sure about this. 
  # Would I have to store attribute_id in the product and product_variant table?
  belongs_to :product
  
  
end
