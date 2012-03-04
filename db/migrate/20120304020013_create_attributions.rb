class CreateAttributions < ActiveRecord::Migration
  def change
    create_table :attributions do |t|
      t.integer :product_variant_id
      t.integer :attribute_id
      t.string :value

      t.timestamps
    end
  end
end
