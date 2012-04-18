class CreatePosts < ActiveRecord::Migration
  def change
    [:posts, :post_drafts].each do |table_name|
    create_table table_name do |t|
      t.references :posts if table_name == :post_drafts
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
end
