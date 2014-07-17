class CreateParkingSpots < ActiveRecord::Migration
  def change
    create_table :parking_spots do |t|
      t.integer :number

      t.timestamps
    end
  end
end
