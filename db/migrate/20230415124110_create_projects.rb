class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :client_id
      t.boolean :active

      t.timestamps
    end
  end
end
