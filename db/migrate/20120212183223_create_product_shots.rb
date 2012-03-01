class CreateProductShots < ActiveRecord::Migration
  def change
    create_table :product_shots do |t|
      t.integer :product_id
     

      t.timestamps
    end
  end
end
