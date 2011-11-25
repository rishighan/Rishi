class Category < ActiveRecord::Base
  
  belongs_to :post
  
  validates :category_name, :category_description, :presence => true
  
end
