class CreateAttributions < ActiveRecord::Migration
  def change
    create_table :attributions do |t|
      t.integer :variant_id
      t.integer :trait_id
      t.string :value

      t.timestamps
    end
  end
end
