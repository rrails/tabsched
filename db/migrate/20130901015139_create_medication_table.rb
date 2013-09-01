class CreateMedicationTable < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string  :medication_name
      t.integer :stock_quantity
      t.datetime :expiry_date
      t.string  :directions
      t.string  :notes
      t.boolean :archive
      t.integer :medication_type_id
      t.integer :user_id
      t.timestamps
    end
  end
end
