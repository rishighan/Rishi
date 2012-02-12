class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :productCategory_title
      t.text :productCategory_description

      t.timestamps
    end
  end
end
