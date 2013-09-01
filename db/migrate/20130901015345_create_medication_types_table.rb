class CreateMedicationTypesTable < ActiveRecord::Migration
  def change
    create_table :medicationtypes do |t|
      t.string  :medication_type
      t.timestamps
    end
  end
end
