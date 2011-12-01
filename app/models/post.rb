class Post < ActiveRecord::Base
  
  belongs_to :category
  has_many :attachments, :dependent => :destroy
  validates :title, :category_id, :content, :presence =>true
  
  acts_as_taggable_on :keywords
  accepts_nested_attributes_for :attachments, :allow_destroy => true
  
end
