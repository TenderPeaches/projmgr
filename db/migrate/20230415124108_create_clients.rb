class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.integer :contact_id
      t.string :company_name

      t.timestamps
    end
  end
end
