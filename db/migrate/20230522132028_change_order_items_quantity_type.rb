class ChangeOrderItemsQuantityType < ActiveRecord::Migration[7.0]
  def change
    change_column(:order_items, :quantity, :float)
  end
end
