class CreateStatements < ActiveRecord::Migration[7.0]
  def change
    create_table :statements do |t|
      t.datetime :sent_date

      t.timestamps
    end
  end
end
