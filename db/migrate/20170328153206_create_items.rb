class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :product, foreign_key: true
      t.references :sale, foreign_key: true
      t.integer :quantity
      t.decimal :total, precision: 8, scale: 2

      t.timestamps
    end
  end
end
