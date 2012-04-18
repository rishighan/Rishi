class CreatePosts < ActiveRecord::Migration
  def change
    [:posts, :post_drafts].each do |table_name|
    create_table table_name,  :force => true do |t|
      t.references :post if table_name == :post_drafts
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
end
