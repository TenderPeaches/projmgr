class AddStartEndTimeToShifts < ActiveRecord::Migration[7.0]
  def change
    add_column :shifts, :start, :datetime
    add_column :shifts, :end, :datetime
    remove_column :shifts, :minutes, :integer
  end
end
