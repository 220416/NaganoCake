class CreateCartItems < ActiveRecord::Migration[6.1]
    def change
    create_table :cart_items do |t|
      t.integer :item_id, null:false
      t.integer :customer_id, null:false
      t.integer :amount, null:false
      t.timestamps
    end
    add_foreign_key :cart_items, :items, column: :item_id
    add_foreign_key :cart_items, :customers, column: :customer_id
  end
end
