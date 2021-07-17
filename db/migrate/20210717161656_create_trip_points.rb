class CreateTripPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :trip_points do |t|
      t.references :trip,  foreign_key: true
      t.references :point, foreign_key: true
      t.timestamps
    end
  end
end
