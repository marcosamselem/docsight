class CreateQualifications < ActiveRecord::Migration[7.0]
  def change
    create_table :qualifications do |t|
      t.string :name
      t.integer :year_obtained
      t.string :establishment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
