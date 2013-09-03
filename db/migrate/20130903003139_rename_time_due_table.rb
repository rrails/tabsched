class RenameTimeDueTable < ActiveRecord::Migration
  def change
    remove_column :journals, :time_due
    add_column :journals, :date_taken, :datetime
  end
end
