class Dropcolumnfrequencytypefromrosterstable < ActiveRecord::Migration
  def change
    remove_column :rosters, :frequencytype_id
  end
end
