class AddDosageToJournalsTable < ActiveRecord::Migration
  def change
    add_column :journals, :dosage, :integer
    add_column :journals, :parent_id, :integer
  end
end
