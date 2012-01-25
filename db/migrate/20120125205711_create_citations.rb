class CreateCitations < ActiveRecord::Migration
  def change
    create_table :citations do |t|
      t.integer :post_id
      t.string :source_name
      t.text :extended_description

      t.timestamps
    end
  end
end
