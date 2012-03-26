class CreateDigitalfiles < ActiveRecord::Migration
  def change
    create_table :digitalfiles do |t|
      t.integer :variant_id

      t.timestamps
    end
  end
end
