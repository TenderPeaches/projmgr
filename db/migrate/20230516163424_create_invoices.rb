class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.references :statement, null: false, foreign_key: true
      t.datetime :due_date
      t.timestamps
    end
  end
end
