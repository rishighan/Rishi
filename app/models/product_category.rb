class ProductCategory < ActiveRecord::Base
  validates :title, :description , :presence => true
  
  has_and_belongs_to_many :products
  
end
