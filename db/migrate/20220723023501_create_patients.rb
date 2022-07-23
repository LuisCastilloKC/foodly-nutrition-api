class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :firstName
      t.string :lastName
      t.references :nutritionists, null: false, foreign_key: true

      t.timestamps
    end
  end
end
