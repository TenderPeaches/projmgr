class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.datetime :start_dt
      t.datetime :end_dt
      t.text :notes
      t.references :task, null: false, foreign_key: true
      t.references :order_item, null: true, foreign_key: true

      t.timestamps
    end
  end
end
