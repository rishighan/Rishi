class CombineItemsInCart < ActiveRecord::Migration
  
  def self.up
    # replace multiples of a certain variant in the cart with a single variant
    
    Cart.all.each do |cart|
      sums= cart.line_items.group(:variant_id).sum(:quantity)

      sums.each do |variant_id, quantity|
        if quantity > 1
          cart.line_items.where(:variant_id=>variant_id).delete_all

          #replace with a single item
          cart.line_items.create(:variant_id=>variant_id, :quantity=>quantity)
        end
      end
    end
  end

  def self.down
   #rollback 
   LineItem.where("quantity>1").each do |line_item|
      #add individual items
      line_item.quantity.times do
        LineItem.create :cart_id=> line_item.cart_id, :variant_id => line_item.variant_id, :quantity =>1 
      end
      
      #destroy
      line_item.destroy
   end
  end

end
