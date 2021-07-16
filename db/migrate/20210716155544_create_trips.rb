class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.datetime   :trip_date,            null: false
      t.string     :trip_title,           null: false
      t.text       :trip_comment,         null: false
      t.references :user,                 foreign_key: true
      t.timestamps
    end
  end
end
