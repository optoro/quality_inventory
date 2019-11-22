class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.string :status, null: false
      t.string :condition, null: false
      t.integer :price_cents, null: false
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
