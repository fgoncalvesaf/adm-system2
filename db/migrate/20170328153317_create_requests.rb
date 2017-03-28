class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :product, foreign_key: true
      t.references :client, foreign_key: true
      t.date :request_date

      t.timestamps
    end
  end
end
