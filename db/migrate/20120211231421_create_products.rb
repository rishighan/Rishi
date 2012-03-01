class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_category_id
      t.string :title
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :quantity # measure of how many SKUs we have in stock.
      

      t.timestamps
    end
  end
end
