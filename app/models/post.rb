class Post < ActiveRecord::Base

  # include Tire::Model::Search
  # include Tire::Model::Callbacks
  
  belongs_to :category
  has_many :attachments, :dependent => :destroy
  has_many :citations, :dependent => :destroy
  
  validates :title, :category_id, :content, :presence =>true
  
  acts_as_taggable_on :keywords
  accepts_nested_attributes_for :attachments, :allow_destroy => true, 
                                :reject_if => proc { |attributes| attributes['photo'].blank? }
  accepts_nested_attributes_for :citations, :allow_destroy=>true
  
end
