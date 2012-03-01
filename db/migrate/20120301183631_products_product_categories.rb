class ProductsProductCategories < ActiveRecord::Migration
  def up
    create_table :products_product_categories, :id => false do |t|
    t.integer :product_category_id
    t.integer :product_id
    end
  end

  def down
  end
end
