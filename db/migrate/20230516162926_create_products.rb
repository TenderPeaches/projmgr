class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :cost
      t.string :description, null: true

      t.timestamps
    end
  end
end
