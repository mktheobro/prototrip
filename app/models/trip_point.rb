# こっちは中間テーブル

class TripPoint < ApplicationRecord
  belongs_to :trip
  belongs_to :point
end
