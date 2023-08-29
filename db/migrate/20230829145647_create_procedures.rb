class CreateProcedures < ActiveRecord::Migration[7.0]
  def change
    create_table :procedures do |t|
      t.string :name
      t.references :doctor, null: false, foreign_key: true
      t.float :price
      t.integer :duration

      t.timestamps
    end
  end
end
