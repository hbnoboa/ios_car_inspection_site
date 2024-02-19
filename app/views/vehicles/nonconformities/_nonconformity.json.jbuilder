json.extract! nonconformity, :id, :vehicleParts, :nonconformityTypes, :nonconformityLevels, :quadrants, :measures, :nonconformityLocals, :vehicle_id, :created_at, :updated_at
json.url url_for([@vehicle, nonconformity], format: :json)
