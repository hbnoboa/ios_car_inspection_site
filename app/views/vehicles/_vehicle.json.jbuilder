json.extract! vehicle, :id, :location, :vehicleType, :chassis, :nonconformity, :model, :status, :ship, :situation, :observations, :et_chassis, :profile, :front, :back, :right_side, :left_side, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
