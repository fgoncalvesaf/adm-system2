class CreateDiscounts < ActiveRecord::Migration[5.0]
  def change
    create_table :discounts do |t|
      t.string :name
      t.integer :kind
      t.decimal :value, precision: 8, scale: 2
      t.text :description

      t.timestamps
    end
  end
end
