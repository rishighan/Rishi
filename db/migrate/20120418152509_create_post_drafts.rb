class CreatePostDrafts < ActiveRecord::Migration
  def change
    create_table :post_drafts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
