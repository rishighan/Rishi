class CreateVariantAttributes < ActiveRecord::Migration
  def change
    create_table :variant_attributes do |t|
      t.integer :product_variant_id
      t.integer :product_attribute_id
      t.string :value

      t.timestamps
    end
  end
end
