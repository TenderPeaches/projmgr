class CreateEstimates < ActiveRecord::Migration[7.0]
  def change
    create_table :estimates do |t|
      t.references :statement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
