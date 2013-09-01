class CreateScheduleTable < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.text :schedule_rule
      t.datetime  :next_occurrence
      t.integer :user_id
      t.integer :medication_id
      t.timestamps
    end
  end
end
