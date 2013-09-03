class AddLastDueScheduleTable < ActiveRecord::Migration
  def change
    add_column :schedules, :previous_occurrence, :datetime
    add_column :schedules, :dosage, :integer
  end
end
