class LineItem < ActiveRecord::Base
  
  belongs_to :cart
  belongs_tp :product
  
end
