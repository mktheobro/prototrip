class Trip < ApplicationRecord
  belongs_to :user
  has_many :points, through: :trip_points
end
