class ProductVariant < ActiveRecord::Base
  
  belongs_to :product
  belongs_to :product_categories
  
  has_many :variant_attributes
end
