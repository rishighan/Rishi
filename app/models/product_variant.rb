class ProductVariant < ActiveRecord::Base
  
  belongs_to :product  
  
  #attributes
  has_many :attributions
  has_many :attributes, :through => :attribution
  
  #attached photos
  has_many :product_shots, :as => :attachable, :dependent => :destroy
end
