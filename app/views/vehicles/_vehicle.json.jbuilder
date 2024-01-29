json.extract! vehicle, :id, :location, :type, :chassis, :nonconformity, :model, :status, :ship, :situation, :observations, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
