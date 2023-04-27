class AddDurationToShifts < ActiveRecord::Migration[7.0]
  def change
    add_column :shifts, :duration, :integer
  end
end
