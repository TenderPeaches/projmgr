class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.integer :minutes
      t.text :notes

      t.belongs_to :task, foreign_key: true

      t.timestamps
    end

    add_index(:shifts, :task)
  end
end
