class CreateProductVariants < ActiveRecord::Migration
  def change
    create_table :product_variants do |t|
      t.integer :product_id
      t.decimal :price
      t.integer :quantity
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
