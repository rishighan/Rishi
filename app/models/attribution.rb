class Attribution < ActiveRecord::Base
  
  belongs_to :variant
  belongs_to :trait
  
  accepts_nested_attributes_for :trait
end
