json.array! @nonconformities do |nonconformity|
  json.partial! 'nonconformities/nonconformity', nonconformity: nonconformity
end