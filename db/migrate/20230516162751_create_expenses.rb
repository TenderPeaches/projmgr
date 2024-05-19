class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.decimal :amount, precision: 8, scale: 2
      t.string :name
      t.datetime :incurred_dt
      t.references :expense_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
