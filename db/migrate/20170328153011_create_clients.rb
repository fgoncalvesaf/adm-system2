class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.date :birthday
      t.string :phone
      t.string :email
      t.text :notes

      t.timestamps
    end
  end
end
