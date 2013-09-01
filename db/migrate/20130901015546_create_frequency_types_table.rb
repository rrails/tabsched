class CreateFrequencyTypesTable < ActiveRecord::Migration
  def change
    create_table :frequencytypes do |t|
      t.string  :frequency_type
      t.timestamps
    end
  end
end
