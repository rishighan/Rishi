class ProductCategory < ActiveRecord::Base
  validates :productCategory_title, :productCategory_description , :presence => true
  
  has_many :products
  
end
