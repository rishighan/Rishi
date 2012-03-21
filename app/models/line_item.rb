class LineItem < ActiveRecord::Base
  
  belongs_to :cart
  belongs_to :variant
  belongs_to :order
  
  def total_price
    variant.price * quantity
  end
 
end
