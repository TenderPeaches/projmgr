class CreateClientContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :client_contacts do |t|
      t.belongs_to :contact, null: false, foreign_key: true
      t.belongs_to :client, null: false, foreign_key: true
    end
  end
end
