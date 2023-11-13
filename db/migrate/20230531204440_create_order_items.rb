class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    drop_table :order_items
    create_table :order_items do |t|
      t.float :quantity
      t.float :subtotal
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
