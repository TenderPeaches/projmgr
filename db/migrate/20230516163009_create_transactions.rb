class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :type
      t.decimal :amount, precision: 8, scale: 2
      t.datetime :date_incurred

      t.timestamps
    end
  end
end
