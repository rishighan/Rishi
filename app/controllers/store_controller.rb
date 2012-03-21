class StoreController < ApplicationController
  def index
    @product = Product.all
    @cart =current_cart
   
  end
  
  def update_pricebox
    price = params([:variant_select_id])
  end

end
