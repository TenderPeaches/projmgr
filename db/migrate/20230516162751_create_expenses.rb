class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.decimal :amount
      t.string :label
      t.date :date_incurred
      t.references :expense_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
