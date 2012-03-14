class Variant < ActiveRecord::Base
  
  belongs_to :product
  has_many :attributions, :dependent => :destroy
  has_many :traits, :through=> :attributions
  
  accepts_nested_attributes_for :traits, :allow_destroy =>true
  
end
