class Category < ActiveRecord::Base
  
  has_many :posts
  validates :category_name, :category_description, :presence => true
  
end
