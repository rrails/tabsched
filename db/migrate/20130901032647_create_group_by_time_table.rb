class CreateGroupByTimeTable < ActiveRecord::Migration
  def change
     create_table :timeperiods do |t|
      t.text      :timeperiodname_id
      t.datetime  :time_of_day
      t.integer   :user_id
      t.timestamps
    end
  end
end
