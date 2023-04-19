class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :project, foreign_key: true

      t.timestamps
    end

    add_reference :tasks, :category, foreign_key: { to_table: :task_categories }
    add_index :tasks, :task_categories
  end
end
