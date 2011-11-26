class Post < ActiveRecord::Base
  
  has_many :categories
  has_many :attachments, :dependent => :destroy
  validates :title, :category_id, :content, :presence =>true
  
  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :attachments, :allow_destroy => true
  
end
