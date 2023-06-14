class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :item_id, null:false
      t.integer :order_id, null:false
      t.integer :price, null:false
      t.integer :amount, null:false
      t.timestamps
  end
    add_foreign_key :order_details, :items, column: :item_id
    add_foreign_key :order_details, :orders, column: :order_id
  end
end
