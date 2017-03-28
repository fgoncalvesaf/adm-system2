json.extract! request, :id, :product_id, :client_id, :request_date, :created_at, :updated_at
json.url request_url(request, format: :json)
