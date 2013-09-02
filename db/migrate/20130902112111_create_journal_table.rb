class CreateJournalTable < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.integer      :user_id
      t.integer      :medication_id
      t.integer      :timeperiod_id
      t.datetime     :time_due
      t.datetime     :date_due
      t.string       :status
      t.timestamps
    end
  end
end
