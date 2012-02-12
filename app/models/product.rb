class Product < ActiveRecord::Base
  
  validates :title, :description, :price, :presence=>true
  validates :title, :uniqueness => true
  validates :price, :numericality =>{:greater_than_or_equal_to => 0.01}
  
  
  belongs_to :productCategory
  has_many :productShots
  accepts_nested_attributes_for :productShots, :allow_destroy => true,
                                :reject_if => proc { |attributes| attributes['shot'].blank? } 
  
end