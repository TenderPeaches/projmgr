class CreateCredits < ActiveRecord::Migration[7.0]
  def change
    create_table :credits do |t|
      t.references :invoice, null: false, foreign_key: true
      t.string :reason

      t.timestamps
    end
  end
end
