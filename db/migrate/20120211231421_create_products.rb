class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_category_id
      t.string :title
      t.text :description
      t.decimal :price
      

      t.timestamps
    end
  end
end
