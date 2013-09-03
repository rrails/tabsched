class AddDosageToRosterTable < ActiveRecord::Migration
  def change
    add_column :rosters, :dosage, :integer
  end
end
