class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.integer :minutes
      t.text :notes
      t.belongs_to :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
