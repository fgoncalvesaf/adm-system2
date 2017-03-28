json.extract! item, :id, :product_id, :sale_id, :quantity, :total, :created_at, :updated_at
json.url item_url(item, format: :json)
