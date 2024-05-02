class CreatePayables < ActiveRecord::Migration[7.0]
  def change
    create_table :payables do |t|

      t.timestamps
    end
  end
end
