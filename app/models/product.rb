class Product < ActiveRecord::Base
  
  validates :name, :description, :presence=>true
  validates :name, :uniqueness => true
 
  #categories
  has_and_belongs_to_many :product_categories
  accepts_nested_attributes_for :product_categories
  
  #variants
  has_many :variants, :dependent => :destroy
  
  #attached photos
  has_many :product_shots, :dependent => :destroy
  accepts_nested_attributes_for :product_shots, :allow_destroy => true,
                                :reject_if => proc { |attributes| attributes['shot'].blank? } 
  
  
end