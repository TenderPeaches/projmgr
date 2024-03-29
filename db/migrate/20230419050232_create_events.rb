class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :name
      t.text :notes
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
