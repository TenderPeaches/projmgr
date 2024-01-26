class AddLabelToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :label, :string
    change_column :expenses, :amount, :decimal
  end
end
