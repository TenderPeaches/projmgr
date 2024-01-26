class CreateExpenseTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_types do |t|
      t.string :label
      t.string :description

      t.timestamps
    end
  end
end
