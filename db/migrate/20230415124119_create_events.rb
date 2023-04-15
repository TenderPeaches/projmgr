class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :project_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :name
      t.text :notes
      t.integer :task_id

      t.timestamps
    end
  end
end
