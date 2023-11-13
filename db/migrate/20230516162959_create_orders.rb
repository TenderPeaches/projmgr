class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :client, null: false, foreign_key: true
      t.float :subtotal
      t.float :gst
      t.float :pst
      t.float :discount
      t.float :total
      t.string :notes
      t.datetime :deadline

      t.timestamps
    end

    add_index :orders, :deadline

    create_table :order_items, id: false do |t|
      t.bigint :order_id
      t.bigint :product_id

      t.float :subtotal
      t.integer :quantity
    end

    add_index :order_items, :order_id
    add_index :order_items, :product_id

    create_join_table :orders, :statements do |t|
      t.index :order_id
      t.index :statement_id
    end
  end
end
