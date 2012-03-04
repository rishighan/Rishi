class ProductVariant < ActiveRecord::Base
  
  belongs_to :product  
  has_many :variant_attributes
  
  #attached photos
  has_many :product_shots, :as => :attachable, :dependent => :destroy
end