class Nonconformity < ApplicationRecord
  belongs_to :vehicleParts
  belongs_to :nonconformityTypes
  belongs_to :nonconformityLevels
  belongs_to :quadrants
  belongs_to :measures
  belongs_to :nonconformityLocals
end
