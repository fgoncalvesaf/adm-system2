json.extract! sale, :id, :client_id, :sale_date, :total, :remaining, :status, :discount_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)
