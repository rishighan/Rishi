class Attribute < ActiveRecord::Base
  
  validates :name, :descrition, :presence =>true
  
  has_many :attributions
  has_many :product_variants, :through => :attributions
end
