class Nonconformity < ApplicationRecord
  belongs_to :vehicle

  has_many_attached :file1
  has_many_attached :file2
  has_many_attached :file3
  has_many_attached :file4
end
