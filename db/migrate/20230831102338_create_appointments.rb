class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :location, null: false, foreign_key: true
      t.text :additional_details
      t.string :symptoms
      t.date :start_date
      t.date :end_date
      t.integer :status, default: 0
      t.references :patient, foreign_key: { to_table: :users }
      t.references :doctor, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end