class Vehicle < ApplicationRecord
    has_many :nonconformities

    has_many_attached :et_chassis
    has_many_attached :profile
    has_many_attached :front
    has_many_attached :back
    has_many_attached :right_side
    has_many_attached :left_side
end
