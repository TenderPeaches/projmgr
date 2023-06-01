class ChangeShiftColumnNames < ActiveRecord::Migration[7.0]
  def change
    change_table :shifts do |t|
      t.rename :end, :end_dt
      t.rename :start, :start_dt
    end
    change_table :task_categories do |t|
      t.boolean :default
    end
  end
end
