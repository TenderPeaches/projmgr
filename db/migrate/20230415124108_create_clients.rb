class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :company_name
      
      t.timestamps
    end

    create_table :client_contacts, id: false do |t|
      t.belongs_to :client, foreign_key: true
      t.belongs_to :contact, foreign_key: true
    end

    add_index(:client_contacts, [:client, :contact])
  end
end
