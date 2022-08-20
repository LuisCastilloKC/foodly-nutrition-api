class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :firstname
      t.string :lastname
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
