class CreateProductShots < ActiveRecord::Migration
  def change
    create_table :product_shots do |t|
      t.integer :attachable_id
      t.string :attachable_type

      t.timestamps
    end
  end
end
