class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.references :client, foreign_key: true
      t.date :sale_date
      t.decimal :total, precision: 8, scale: 2
      t.decimal :remaining, precision: 8, scale: 2
      t.integer :status
      t.references :discount, foreign_key: true

      t.timestamps
    end
  end
end
