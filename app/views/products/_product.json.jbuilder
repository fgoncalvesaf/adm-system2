json.extract! product, :id, :name, :price, :photo, :description, :status, :created_at, :updated_at
json.url product_url(product, format: :json)
