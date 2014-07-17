class AddParkingToContract < ActiveRecord::Migration
  def change
    add_reference :contracts, :parking_spot
  end
end
