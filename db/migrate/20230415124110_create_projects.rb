class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :active

      t.belongs_to :client, foreign_key: true

      t.timestamps
    end

    add_index(:projects, :client)
  end
end
