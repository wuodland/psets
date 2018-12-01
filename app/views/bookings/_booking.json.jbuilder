json.extract! booking, :id, :customer_id, :destination, :ride_id, :driverphn, :carno, :cartype, :created_at, :updated_at
json.url booking_url(booking, format: :json)
