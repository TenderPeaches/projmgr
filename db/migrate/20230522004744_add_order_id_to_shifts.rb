class AddOrderIdToShifts < ActiveRecord::Migration[7.0]
  def change
    add_reference :shifts, :order_item, foreign_key: false
  end
end
