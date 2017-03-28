class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.string :photo
      t.text :description
      t.integer :status

      t.timestamps
    end
  end
end
