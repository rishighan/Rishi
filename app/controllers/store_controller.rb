class StoreController < ApplicationController
  def index
    @product = Product.all
    @variant = Variant.all
    
    @cart =current_cart
 
  end
  
 

end
