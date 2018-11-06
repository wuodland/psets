json.extract! customer, :id, :name, :role, :ban, :created_at, :updated_at
json.url customer_url(customer, format: :json)
