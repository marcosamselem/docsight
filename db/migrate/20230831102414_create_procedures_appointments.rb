class CreateProceduresAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :procedures_appointments do |t|
      t.references :appointment, null: false, foreign_key: true
      t.references :procedure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
