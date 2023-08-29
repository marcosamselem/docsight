class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :appointment, null: false, foreign_key: true
      t.text :comment
      t.integer :rating

      t.timestamps
    end
  end
end
