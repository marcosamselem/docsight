class CreateQualifications < ActiveRecord::Migration[7.0]
  def change
    create_table :qualifications do |t|
      t.string :name
      t.string :year_obtained
      t.string :estabilshment
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
