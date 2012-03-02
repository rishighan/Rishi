class CreateProductShots < ActiveRecord::Migration
  def change
    create_table :product_shots do |t|
      t.integer :product_id
      t.integer :product_variant_id

      t.timestamps
    end
  end
end
