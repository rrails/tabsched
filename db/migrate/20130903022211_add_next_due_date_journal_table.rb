class AddNextDueDateJournalTable < ActiveRecord::Migration
  def change
    add_column :journals, :next_due, :datetime
  end
end
