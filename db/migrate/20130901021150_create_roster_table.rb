class CreateRosterTable < ActiveRecord::Migration
 def change
    create_table :rosters do |t|
      t.integer  :frequencytype_id
      t.datetime  :starting_date
      t.datetime  :ending_date
      t.datetime  :last_taken
      t.integer   :user_id
      t.integer   :medication_id
      t.integer   :group_id
      t.timestamps
    end
  end
end
