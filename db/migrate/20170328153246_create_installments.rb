class CreateInstallments < ActiveRecord::Migration[5.0]
  def change
    create_table :installments do |t|
      t.references :sale, foreign_key: true
      t.date :payment_date
      t.decimal :value, precision: 8, scale: 2

      t.timestamps
    end
  end
end
