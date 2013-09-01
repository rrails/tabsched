class CreateTimePeriodNamesTable < ActiveRecord::Migration
  def change
     create_table :timeperiodnames do |t|
      t.text      :time_period_name
      t.timestamps
    end
  end
end
