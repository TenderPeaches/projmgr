class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.integer :task_id
      t.integer :minutes
      t.text :notes

      t.timestamps
    end
  end
end
