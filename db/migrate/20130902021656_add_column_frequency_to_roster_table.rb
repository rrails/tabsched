class AddColumnFrequencyToRosterTable < ActiveRecord::Migration
  def change
    add_column :rosters, :frequency, :string
  end
end
