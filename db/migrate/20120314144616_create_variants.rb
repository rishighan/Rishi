class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.integer :product_id
      t.decimal :price
      t.integer :quantity
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
