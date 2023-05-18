class CreateStatements < ActiveRecord::Migration[7.0]
  def change
    create_table :statements do |t|
      t.string :type
      t.datetime :sent_date               # date the statement is sent to the contacts

      t.timestamps
    end
  end
end
