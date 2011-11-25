class Post < ActiveRecord::Base
  
  has_many :categories
  
  validates :title, :category_id, :content, :presence =>true
  accepts_nested_attributes_for :categories
  
end
