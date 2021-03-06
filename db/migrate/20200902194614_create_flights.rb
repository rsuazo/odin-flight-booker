class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.integer :from_airport_id
      t.integer :to_airport_id
      t.date :start_date
      t.integer :flight_duration

      t.timestamps
    end
  end
end
