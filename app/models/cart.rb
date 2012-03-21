class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  
  
  def total_items
    line_items.sum(:quantity)
  end

  def add_variant(variant_id)
    current_item = line_items.find_by_variant_id(variant_id)
    if (current_item)
    current_item.quantity += 1
    else
      current_item =line_items.build(:variant_id => variant_id)
    end
    current_item #returns the product id, FYI
  end

  def total_price
    line_items.to_a.sum {|item| item.total_price}
  end

end