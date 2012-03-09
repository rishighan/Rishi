class Attribute < ActiveRecord::Base
  
  validates :name, :description, :presence =>true
  
  has_many :attributions
  has_many :product_variants, :through => :attributions
  
  belongs_to :product
 
end
