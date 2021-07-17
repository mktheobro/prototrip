class Point < ApplicationRecord
  has_many_attached :images
  has_many :trips, through: :trip_points
end
