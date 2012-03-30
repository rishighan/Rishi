class CategoriesPosts < ActiveRecord::Migration
  def up
  	create_table :categories_posts, :id => false do |t|
    t.integer :category_id
    t.integer :post_id
    end
  end

  def down
  end
end
