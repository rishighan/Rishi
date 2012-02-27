class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :firstname
      t.string :lastname
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :phone
      t.string :email
      t.string :pay_type
      t.date   :card_expires_on
      t.timestamps
    end
  end
end
